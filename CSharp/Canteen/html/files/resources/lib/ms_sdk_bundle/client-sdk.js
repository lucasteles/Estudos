(function (root, factory) {
    "use strict";

    if (typeof define === 'function' && define.amd) {
        define(['lodash', 'q', 'EventEmitter', 'localforage', 'moment', 'tv4', 'CryptoJS'], function (_, Q, EventEmitter, localforage, moment, tv4, CryptoJS) {
            return factory(root, Q, EventEmitter, localforage, _, moment, tv4, CryptoJS);
        });
    } else {
        root.AppClient = factory(root, root.Q, root.EventEmitter, root.localforage, root._, root.moment, root.tv4, root.CryptoJS);
    }

}(this, function (root, Q, EventEmitter, localforage, _, moment, tv4, CryptoJS) {
    "use strict";

    var console = root.console;

    var State = {};
    Object.defineProperties(State, {
        "INITIAL": {
            "enumerable": true,
            "value": "initial"
        },
        "OFFLINE": {
            "enumerable": true,
            "value": "offline"
        },
        "ONLINE": {
            "enumerable": true,
            "value": "online"
        },
        "SYNCHRONIZING": {
            "enumerable": true,
            "value": "synchronizing"
        },
        "SYNC_FAILED": {
            "enumerable": true,
            "value": "sync_failed"
        }
    });

    var AppClient = function () {
        _.bindAll(this, "init",
            "initOffline", "initOnline",
            "getModelListOffline", "getModelsMetaDataOnline",
            "initDAOOffline", "initDAOOnline", "setSessionToken",
            "login", "logout",
            "dao", "folder",
            "isOffline", "isOnline",
            "goOffline", "goOnline",
            "retrySync", "resetFailedSync",
            "_pushDeferredActionIntoQueue", "_executeDeferredActionsQueue",
            "_getDeferredActionsForModel", "_removeDeferredAction",
            "_persistDeferredActionsQueue", "synchronize", "_persistUsersData","invoke");

        this._stateStorageKey = null;
        this._deferredActionsStorageKey = null;
        this._modelListStorageKey = null;
        this._currentUser = null;

        this.state = State.INITIAL;

        this.settings = {
            rest_api_version : "1",
            isDataValidationEnabled : true
        };

        this._daoMap = {};

        this._deferredActions = null;

        this._usersData = null;
    };

    AppClient.prototype = _.clone(EventEmitter.prototype);

    AppClient.prototype.State = State;

    AppClient.prototype.init = function (settings) {
        if (this.state !== State.INITIAL) {
            // AppClient has already been initialized
            return Q(this);
        }

        return Q.Promise(function (resolve, reject) {
            console.log("Client SDK: init");
            _.extend(this.settings, settings);

            if (!this.settings.domain) {
                throw new InitializationError("Required setting 'domain' is empty");
            }

            if (!this.settings.apiKey) {
                throw new InitializationError("Required setting 'apiKey' is empty");
            }

            if(!/^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$/.test(this.settings.domain)){
                throw new InitializationError("Setting 'domain' is invalid");
            }

            var url = this.settings._url = {};
            url.meta = "https://api." + this.settings.domain + "/rest/"+this.settings.rest_api_version+"/apiexpress/meta";
            url.rest = "https://api." + this.settings.domain + "/rest/"+this.settings.rest_api_version+"/apiexpress/api";
            url.security = "https://api." + this.settings.domain + "/rest/"+this.settings.rest_api_version+"/apiexpress/security";

            this._modelListStorageKey = "sdk-model-list";
            this._deferredActionsStorageKey = "sdk-deferred-actions";
            this._stateStorageKey = "sdk-state";
            this._usersDataStorageKey = "sdk-users-data";

            localforage.config({
                "name": "ms:" + this.settings.domain + ":" + this.settings.apiKey,
                "driver": [
                    localforage.INDEXEDDB,
                    localforage.LOCALSTORAGE
                ]
            });

            resolve();

        }.bind(this))
            //loading cached users data
            .then(function () {
                return Q.Promise(function (resolve, reject) {
                    localforage.getItem(this._usersDataStorageKey, function (err, data) {
                        if (err) {
                            reject(err);
                        } else {
                            resolve(this._usersData = data || []);
                        }
                    }.bind(this));
                }.bind(this))
            }.bind(this))
            //loading deffered actions
            .then(function () {
                return Q.Promise(function (resolve, reject) {
                    localforage.getItem(this._deferredActionsStorageKey, function (err, actions) {
                        if (err) {
                            reject(err);
                        } else {
                            resolve(this._deferredActions = actions || []);
                        }
                    }.bind(this));
                }.bind(this))
            }.bind(this))
            //loading previous sdk state
            .then(function () {
                return Q.Promise(function (resolve, reject) {
                    localforage.getItem(this._stateStorageKey, function (err, state) {
                        if (err) {
                            reject(err);
                        } else {
                            var stateFromInitSettings = this.settings.currentState;
                            var restoredState = state;
                            var isNeedToStoreState = false;
                            //checking incoming state from settings
                            if(!_.isUndefined(stateFromInitSettings) &&
                                !_.isNull(stateFromInitSettings)
                                && _.contains(_.values(State),stateFromInitSettings)
                                && (stateFromInitSettings === State.ONLINE || stateFromInitSettings === State.OFFLINE)){
                                //checking restored state
                                if(!_.isUndefined(restoredState) &&
                                    !_.isNull(restoredState) &&
                                    _.contains(_.values(State),restoredState)
                                    && restoredState !== State.SYNC_FAILED
                                    && restoredState !== State.SYNCHRONIZING
                                    && restoredState !== stateFromInitSettings){
                                    state = stateFromInitSettings;
                                    isNeedToStoreState = true;
                                }
                            }
                            if (_.contains(_.values(State), state)) {
                                this.state = state;
                            } else {
                                this.state = State.ONLINE;
                                isNeedToStoreState = true;
                            }
                            if(isNeedToStoreState){
                                localforage.setItem(this._stateStorageKey, this.state, function (err, state) {
                                    if (err) {
                                        reject(err);
                                    } else {
                                        this.emit("statechange", state);
                                        resolve(state);
                                    }
                                }.bind(this));
                            }else{
                                this.emit("statechange", state);
                                resolve(state);
                            }
                        }
                    }.bind(this));
                }.bind(this))
            }.bind(this))
            //init online/offline, depends on restored sdk state
            .then(function () {
                var promise;
                if (this.isOffline()) {
                    promise = this.initOffline();
                } else {
                    promise = this.initOnline();
                }
                promise = promise.then(function () {
                    this.emit("init");
                }.bind(this));
                promise = promise['catch']((function (err) {
                    console.error(err);
                    return Q.reject(err);
                }).bind(this));
                return promise.then(function () {
                    return this;
                }.bind(this));
            }.bind(this));
    };

    AppClient.prototype.synchronize = function () {
        return Q.Promise(function (resolve, reject) {
            localforage.setItem(this._stateStorageKey, State.SYNCHRONIZING, function (err, state) {
                if (err) {
                    reject(err);
                } else {
                    this.state = state;
                    this.emit("statechange", state);
                    resolve();
                }
            }.bind(this));
        }.bind(this))
            .then(this._executeDeferredActionsQueue)
            .then(function () {
                return Q.Promise(function (resolve, reject) {
                    localforage.setItem(this._stateStorageKey, State.ONLINE, function (err, state) {
                        if (err) {
                            reject(err);
                        } else {
                            this.state = state;
                            this.emit("statechange", state);
                            resolve();
                        }
                    }.bind(this));
                }.bind(this))
            }.bind(this))
            ['catch'](function (err) {
            var outErr = err;
            console.error("Error going online: " + err);
            return Q.Promise(function (resolve, reject) {
                localforage.setItem(this._stateStorageKey, State.SYNC_FAILED, function (err, state) {
                    if (err) {
                        reject(err);
                    } else {
                        this.state = state;
                        this.emit("statechange", state);
                        reject(outErr);
                    }
                }.bind(this));
            }.bind(this))
        }.bind(this));
    };

    AppClient.prototype.initOnline = function () {
        return this.getModelsMetaDataOnline()
            .then(function (metadata) {
                this.settings.isProjectSecured = metadata.isSecurity;
                this._daoMap = {};
                return metadata.models;
            }.bind(this))
            .then(this.initDAOOnline)
            .then(function () {
                if (!this.settings.isProjectSecured) {
                    //project is not secured,start synchronize deferred actions
                    return this.synchronize();
                } else {
                    //project is secured, skip synchronize and just set state to ONLINE
                    return Q.Promise(function (resolve, reject) {
                        localforage.setItem(this._stateStorageKey, State.ONLINE, function (err, state) {
                            if (err) {
                                reject(err);
                            } else {
                                this.state = state;
                                this.emit("statechange", state);
                                resolve();
                            }
                        }.bind(this));
                    }.bind(this))
                }
            }.bind(this));
    };

    AppClient.prototype.initOffline = function () {
        return this.getModelListOffline()
            .then(function (models) {
                this._daoMap = {};
                return models;
            }.bind(this))
            .then(this.initDAOOffline);
    };

    AppClient.prototype.isOffline = function () {
        return this.state === State.OFFLINE;
    };

    AppClient.prototype.isOnline = function () {
        return this.state === State.ONLINE;
    };

    AppClient.prototype.goOffline = function () {
        if (this.state !== State.ONLINE) {
            console.warn("AppClient can go offline state from online state only. Current SDK State: " + this.state);
            return Q();
        }
        var promise = Q.fcall(this.initOffline);
        promise = promise.then(function(){
            return Q.Promise(function (resolve, reject) {
                localforage.setItem(this._stateStorageKey, State.OFFLINE, function (err, state) {
                    if (err) {
                        reject(err);
                    } else {
                        this.state = state
                        this.emit("statechange", state);
                        resolve(state);
                    }
                }.bind(this));
            }.bind(this));
        }.bind(this));
        return promise;
    };

    AppClient.prototype.goOnline = function () {
        if (this.state !== State.OFFLINE) {
            console.warn("AppClient can go online state from offline state only. Current SDK State: " + this.state);
            return Q();
        }
        var promise = Q.fcall(this.initOnline);
        if (this._currentUser !== null && this._currentUser instanceof UserData) {
            promise = promise.then(function () {
                console.log("goOnline: Login user");
                return this.login(this._currentUser.userName, this._currentUser.password);
            }.bind(this));
            promise = promise.then(this.synchronize);
        }
        return promise;
    };

    AppClient.prototype.retrySync = function () {
        if (this.state !== State.SYNC_FAILED) {
            console.warn("AppClient can retry synchronization being in failed sync state only");
            return Q();
        }
        this.state = State.OFFLINE;

        return this.goOnline()
            ['catch'](function (err) {
            this.state = State.SYNC_FAILED;
            return Q.reject(err);
        }.bind(this));
    };

    AppClient.prototype.resetFailedSync = function () {

        if (this.state !== State.SYNC_FAILED) {
            console.warn("AppClient can perform reset operation being in failed sync state only");
            return Q();
        }

        this.state = State.OFFLINE;

        var modelsForPurgeList = _.chain(this._deferredActions)
            .pluck("modelName")
            .uniq();

        return Q.Promise(function (resolve, reject) {
            localforage.removeItem(this._deferredActionsStorageKey, function (err) {
                if (err) {
                    reject(err);
                } else {
                    this._deferredActions = [];
                    resolve();
                }
            }.bind(this));
        }.bind(this))
            .then(this.goOnline)
            .then(function () {
                var purgeCachePromises = modelsForPurgeList.map(function (modelName) {
                    return this.dao(modelName).store.purge();
                }.bind(this)).value();
                return Q.all(purgeCachePromises);
            }.bind(this))
            ['catch'](function (err) {
            this.state = State.SYNC_FAILED;
            return Q.reject(err);
        }.bind(this));
    };

    AppClient.prototype.getModelListOffline = function () {
        return Q.Promise(function (resolve, reject) {
            localforage.getItem(this._modelListStorageKey, function (err, value) {
                console.log("Getting model list offline");
                if (err) {
                    reject(err);
                } else {
                    resolve(value || []);
                }
            }.bind(this));
        }.bind(this));
    };

    AppClient.prototype.getModelsMetaDataOnline = function () {
        console.log("Getting model list online");
        return this.ajax("GET", this.settings._url.meta + "/model").then(function (metaData) {
            return Q.Promise(function (resolve, reject) {
                localforage.setItem(this._modelListStorageKey, metaData.models, function (err, value) {
                    if (err) {
                        reject(err);
                    } else {
                        resolve(metaData);
                    }
                }.bind(this));
            }.bind(this));
        }.bind(this));
    };

    AppClient.prototype.initDAOOnline = function (modelName) {
        if (_.isArray(modelName)) {
            console.log("Initializing DAO list online: " + JSON.stringify(modelName));
            var promises = [];
            for (var i = 0, j = modelName.length; i < j; i++) {
                promises[i] = this.initDAOOnline(modelName[i]);
            }
            return Q.all(promises);
        } else {
            console.log("Initializing DAO online: " + JSON.stringify(modelName));
            return this.ajax("GET", this.settings._url.meta + "/model/" + modelName)
                .then((function (modelMetadata) {
                    var dao = this._daoMap[modelName] = new EntityDAO(this, modelName, modelMetadata);
                    return dao.init();
                }).bind(this));
        }
    };

    AppClient.prototype.initDAOOffline = function (modelName) {
        if (_.isArray(modelName)) {
            console.log("Initializing DAO list offline: " + JSON.stringify(modelName));
            var promises = [];
            for (var i = 0, j = modelName.length; i < j; i++) {
                promises[i] = this.initDAOOffline(modelName[i]);
            }
            return Q.all(promises);
        } else {
            console.log("Initializing DAO offline: " + JSON.stringify(modelName));
            var dao = this._daoMap[modelName] = new EntityDAO(this, modelName);
            return dao.init();
        }
    };

    AppClient.prototype.setSessionToken = function (token) {
        var tokenWrapper = {};
        tokenWrapper.token = token;
        if (_.isUndefined(tokenWrapper.token) || _.isNull(tokenWrapper.token)) {
            return Q.reject("Incorrect session token");
        }
        if (!_.isString(tokenWrapper.token)) {
            return Q.reject("Session token should be a String");
        }
        if (_.isEmpty(tokenWrapper.token)) {
            return Q.reject("Session token cannot be empty");
        }
        this.settings.headers = this.settings.headers || {};
        this.settings.headers["X-Appery-Session-Token"] = tokenWrapper.token;
        return Q(tokenWrapper.token);
    }

    AppClient.prototype.login = function (username, password) {
        if (this.state === State.INITIAL) {
            return Q.reject("SDK is not initialized yet");
        }

        if (!username) {
            return Q.reject("'username' is empty");
        }

        if (!password) {
            return Q.reject("'password' is empty");
        }

        if (this.isOffline()) {
            return Q().then(function () {
                return Q.Promise(function (resolve, reject) {
                    if (_.findIndex(this._usersData, new UserData(username, password)) !== -1) {
                        //offline login success
                        this._currentUser = new UserData(username, password, true);
                        resolve();
                    } else {
                        reject("Invalid username or password");
                    }
                }.bind(this))
            }.bind(this))
                ['catch'](function (err) {
                console.error(err);
                return Q.reject(err);
            }.bind(this));
        } else {

            var options = {};
            options.headers = {};
            options.headers["Content-Type"] = "application/json";
            options.data = {
                "username": username,
                "password": password
            };

            return this.ajax("POST", this.settings._url.security + "/login", options)
                .then(function (tokenObj) {
                    this.settings.headers = this.settings.headers || {};
                    this.settings.headers["X-Appery-Session-Token"] = tokenObj.sessionToken;
                    this._usersData = [];
                    this._usersData.push(new UserData(username, password));
                    this._currentUser = new UserData(username, password, true);
                }.bind(this))
                .then(this._persistUsersData)
                ['catch'](function (err) {
                console.error(err);
                return Q.reject(err);
            }.bind(this));
        }

    };

    AppClient.prototype.logout = function () {

        if (this.state === State.INITIAL) {
            return Q.reject("SDK is not initialized yet");
        }

        if (this._currentUser === null) {
            return Q.reject("You are not logged in");
        }

        if (this.isOffline()) {
            this._currentUser = null;
            return Q.resolve();
        } else {
            var token = this.settings.headers && this.settings.headers["X-Appery-Session-Token"];

            if (!token) {
                return Q.reject("You are not logged in");
            }

            var options = {};
            options.headers = {};
            options.headers["Content-Type"] = "application/json";
            options.data = {
                "token": token
            };

            return this.ajax("POST", this.settings._url.security + "/logout", options)
                .then(function () {
                    if (this.settings.headers) {
                        delete this.settings.headers["X-Appery-Session-Token"];
                    }
                    this._currentUser = null;
                }.bind(this))
                ['catch'](function (err) {
                console.error(err);
                return Q.reject(err);
            }.bind(this));
        }
    };

    AppClient.prototype.dao = function (modelName) {
        if (!modelName) {
            throw new Error("Can't get DAO for empty model name");
        }

        if (Object.keys(this._daoMap).length === 0) {
            throw new Error("No model has been initialized yet");
        }

        var dao = this._daoMap[modelName];

        if (!dao) {
            throw new Error("Model '" + modelName + "' not found");
        }

        return dao;
    };

    AppClient.prototype.folder = function (basePath) {
        return {
            "dao": function (modelName) {
                var path = basePath + "/" + modelName;
                while (path.indexOf("//") !== -1) {
                    path = path.replace("//", "/");
                }
                return this.dao(path);
            }.bind(this)
        };
    };

    AppClient.prototype.invoke = function (method, path, options) {
        var requestBaseURL = this.settings._url.rest;

        if(this.isOffline()){
            return Q.reject("Invoke can be execute only in 'online' mode");
        }

        if(_.isUndefined(path) || _.isNull(path)){
            return Q.reject("Invoke 'path' param is empty");
        }

        if(!_.isString(path)){
            return Q.reject("Incorrect type for invoke 'path' param");
        }

        if(_.isEmpty(path)){
            return Q.reject("Invoke 'path' param is empty");
        }

        if(method !== 'GET' && method !== 'POST'&& method !== 'PUT' && method !== 'DELETE'){
            return Q.reject("Incorrect request method");
        }

        if(method === 'POST' || method === 'PUT'){
            options = options || {};
            options.contentType = options.contentType || "application/json";
        }

        if(!_.endsWith(requestBaseURL,"/") && !_.startsWith(path,"/")){
            requestBaseURL = requestBaseURL + "/";
        }

        requestBaseURL = requestBaseURL + path;

        options = this._buildAjaxOptions(options);

        return this.ajax(method,requestBaseURL,options);
    }

    AppClient.prototype.ajax = function (method, url, options) {
        return Q.Promise(function (resolve, reject) {
            options = options || {};

            options.headers = options.headers || {};

            _.defaults(options.headers, this.settings.headers, options.headers);

            var query = {
                "apiKey": this.settings.apiKey || "key_not_provided"
            };

            if (!_.isEmpty(options.data) && method === 'GET') {
                query = _.defaults(query, options.data);
            }

            if(_.indexOf(url,"?") != -1){
                url = url + '&';
            }else{
                url = url + '?';
            }

            url = url + this._objectToQueryString(query);

            var http = new XMLHttpRequest();

            http.open(method, url, true);

            http.onload = function () {
                // status 200 OK, 201 CREATED, 20* ALL OK
                if (http.status.toString().substr(0, 2) === '20') {
                    if (options.isDetailedAjaxResponceNeeded) {
                        try {
                            resolve(new AjaxDetailResponce(JSON.parse(http.responseText), http));
                        } catch (e) {
                            resolve(new AjaxDetailResponce(http.response, http));
                        }
                    } else {
                        try {
                            resolve(JSON.parse(http.responseText));
                        } catch (e) {
                            resolve(http.response);
                        }
                    }
                } else {
                    reject(http.response);
                }
            };
            http.onerror = function () {
                reject(new Error('Unable to send request to ' + JSON.stringify(url)));
            };

            if (!_.isEmpty(options.headers)) {
                _.each(options.headers, function (value, key) {
                    http.setRequestHeader(key, value);
                });
            }

            if (_.isObject(options.data)) {
                options.data = JSON.stringify(options.data);
            }

            http.send(method === 'GET' ? null : options.data);
        }.bind(this));
    };

    AppClient.prototype._buildAjaxOptions = function (initialOptions) {
        var options = {};

        options.headers = {};
        _.defaults(options.headers, initialOptions.headers);

        if (initialOptions.data) {
            options.data = initialOptions.data;
        }

        if (initialOptions.contentType) {
            options.headers["Content-Type"] = initialOptions.contentType;
        }

        return options;
    };

    AppClient.prototype._objectToQueryString = function (obj) {
        if (!_.isObject(obj)) {
            return obj;
        }
        var pairs = [];
        _.each(obj, function (value, key) {
            pairs.push(encodeURIComponent(key) + '=' + encodeURIComponent(_.isObject(value) ? JSON.stringify(value) : value));
        });
        return pairs.join('&');
    };

    AppClient.prototype._pushDeferredActionIntoQueue = function (action) {
        return Q().then(function () {
            this._deferredActions.push(action);
            return this._persistDeferredActionsQueue();
        }.bind(this));
    };

    AppClient.prototype._getDeferredActionsForModel = function (modelName) {
        var actionsForModel = [];
        for (var i = 0; i < this._deferredActions.length; i++) {
            var action = this._deferredActions[i];
            if (action.modelName === modelName) {
                actionsForModel.push(action);
            }
        }
        return actionsForModel;
    }

    AppClient.prototype._removeDeferredAction = function (action) {
        var promise = Q();
        promise = promise.then(function () {
            this._deferredActions = _.without(this._deferredActions, action);
            return this._persistDeferredActionsQueue();
        }.bind(this));
        return promise;
    }

    AppClient.prototype._persistDeferredActionsQueue = function () {
        return Q.Promise(function (resolve, reject) {
            localforage.setItem(this._deferredActionsStorageKey, this._deferredActions, function (err) {
                if (err) {
                    reject(err);
                } else {
                    resolve();
                }
            });
        }.bind(this));
    }

    AppClient.prototype._persistUsersData = function () {
        return Q.Promise(function (resolve, reject) {
            localforage.setItem(this._usersDataStorageKey, this._usersData, function (err) {
                if (err) {
                    reject(err);
                } else {
                    resolve();
                }
            });
        }.bind(this));
    }

    AppClient.prototype._executeDeferredActionsQueue = function () {
        if (!this._deferredActions || this._deferredActions.length === 0) {
            return Q();
        }

        var promise = Q();
        for (var i = 0; i < this._deferredActions.length; i++) {
            var action = this._deferredActions[i];
            promise = promise.then(_.partial(this.dao(action.modelName)._performDeferredAction, action));
            promise = promise.then(function (deferredResultData) {
                this._deferredActions.shift();
                if (deferredResultData instanceof DeferredCreateActionResultData) {
                    if (!_.isUndefined(deferredResultData.autogeneratedId) && !_.isUndefined(deferredResultData.realId)) {
                        //replacing other deferred linked actions with real id
                        _.forEach(this._deferredActions, function (deferredAction) {
                            var deferredActionData = deferredAction.options.data;
                            if (!_.isUndefined(deferredActionData)) {
                                _.forEach(deferredActionData, function (value, key) {
                                    if (value === deferredResultData.autogeneratedId) {
                                        deferredActionData[key] = deferredResultData.realId;
                                    }
                                });
                            }
                            //check if action url contains __temp_entity_id
                            if (_.endsWith(deferredAction.url, deferredResultData.autogeneratedId)) {
                                deferredAction.url = deferredAction.url.replace(deferredResultData.autogeneratedId, deferredResultData.realId);
                            }
                        });
                    }
                }
                return this._persistDeferredActionsQueue();
            }.bind(this));
        }

        return promise;
    };

//Detailed ajax response
    function AjaxDetailResponce(responceData, httpRequest) {
        this.data = responceData;
        this.httpRequest = httpRequest;
    }

//Data type for deferred create action result
    function DeferredCreateActionResultData(autogeneratedId, realId, data) {
        this.autogeneratedId = autogeneratedId;
        this.realId = realId;
        this.data = data;
    }

//User data
    function UserData(username, password, storePass) {
        this.userName = username;
        this.secret = CryptoJS.MD5(password);
        if (!_.isUndefined(storePass) && storePass) {
            this.password = password;
        }
    }


// Initialization Error
    function InitializationError(message) {
        this.name = 'InitializationError';
        this.message = message || 'Error occurred during Client SDK initialization';
    }

    InitializationError.prototype = new Error();
    InitializationError.prototype.constructor = InitializationError;


// Initialization Error

    function ValidationError(message) {
        this.name = 'ValidationError';
        this.message = message || 'Error occurred during Client SDK initialization';
    }

    ValidationError.prototype = new Error();
    ValidationError.prototype.constructor = ValidationError;

//Adding format validators

    tv4.addFormat('date', function (data, schema) {
        var dateFormats = [
            'YYYYMMDD',
            'YYYY-MM-DD',
            'YYYY-MM',
            'YYYY',
            'YY',
            'YYYYDDD',
            'YYYY-DDD',
            'YYYY[W]wwD',
            'YYYY-[W]ww-D',
            'YYYY[W]ww',
            'YYYY-[W]ww'
        ];
        if (moment(data, dateFormats, true).isValid()) {
            return null;
        }
        return 'A valid ISO 8601 date format expected';
    });

    tv4.addFormat("date-time", function (data, schema) {
        var dateTimeFormats = [
            'YYYYMMDDTHHmmss',
            'YYYYMMDDTHHmmssZ',
            'YYYYMMDDTHHmmss+HHmm',
            'YYYYMMDDTHHmmss-HHmm',
            'YYYYMMDDTHHmmss+HH',
            'YYYYMMDDTHHmmss-HH',
            'YYYY-MM-DDTHH:mm:ss',
            'YYYY-MM-DDTHH:mm:ssZ',
            'YYYY-MM-DDTHH:mm:ss+HH:mm',
            'YYYY-MM-DDTHH:mm:ss-HH:mm',
            'YYYY-MM-DDTHH:mm:ss+HH',
            'YYYY-MM-DDTHH:mm:ss-HH',
            'YYYYMMDDTHHmm',
            'YYYY-MM-DDTHH:mm',
            'YYYYDDDTHHmmZ',
            'YYYY-DDDTHH:mmZ',
            'YYYY[W]wwDTHHmm+HHmm',
            'YYYY[W]wwDTHHmm-HHmm',
            'YYYY-[W]ww-DTHH:mm+HH',
            'YYYY-[W]ww-DTHH:mm-HH',
            'YYYY-MM-DDTHH:mm:ss.SSSS',
            'YYYYMMDD HHmmss',
            'YYYYMMDD HHmmssZ',
            'YYYYMMDD HHmmss+HHmm',
            'YYYYMMDD HHmmss-HHmm',
            'YYYYMMDD HHmmss+HH',
            'YYYYMMDD HHmmss-HH',
            'YYYY-MM-DD HH:mm:ss',
            'YYYY-MM-DD HH:mm:ssZ',
            'YYYY-MM-DD HH:mm:ss+HH:mm',
            'YYYY-MM-DD HH:mm:ss-HH:mm',
            'YYYY-MM-DD HH:mm:ss+HH',
            'YYYY-MM-DD HH:mm:ss-HH',
            'YYYYMMDD HHmm',
            'YYYY-MM-DD HH:mm',
            'YYYYDDD HHmmZ',
            'YYYY-DDD HH:mmZ',
            'YYYY[W]wwD HHmm+HHmm',
            'YYYY[W]wwD HHmm-HHmm',
            'YYYY-[W]ww-D HH:mm+HH',
            'YYYY-[W]ww-D HH:mm-HH',
            'YYYY-MM-DD HH:mm:ss.SSSS',
            'YYYY-MM-DD HH:mm:ss.SSS'
        ];
        if (moment(data, dateTimeFormats, true).isValid()) {
            return null;
        }
        return 'A valid ISO 8601 date/time string expected';
    });

    tv4.addFormat('time', function (data, schema) {
        var timeFormats = [
            'HHmmss',
            'HH:mm:ss',
            'HHmm',
            'HH:mm',
            'HH',
            'HHmmss.ss',
            'HH:mm:ss.ss',
            'HHmm.mm',
            'HH:mm.mm',
            'HHmmssZ',
            'HHmmZ',
            'HHZ',
            'HH:mm:ssZ',
            'HH:mmZ',
            'HHmmss+HHmm',
            'HHmmss-HHmm',
            'HHmmss+HH',
            'HHmmss-HH',
            'HH:mm:ss+HH:mm',
            'HH:mm:ss-HH:mm',
            'HH:mm:ss+HH',
            'HH:mm:ss-HH'
        ];
        if (moment(data, timeFormats, true).isValid()) {
            return null;
        }
        return 'A valid ISO 8601 time string expected';
    });

// Entity DAO

    var EntityDAO = function (sdkInstance, modelName, modelMetadata) {
        _.bindAll(this, "init", "create", "get", "update", "delete", "find", "validate", "_deferAction", "_performDeferredAction");

        this.sdk = sdkInstance;
        this.modelName = modelName;
        this.meta = modelMetadata;
        this._metaStorageKey = "model-meta:" + modelName;
        this.store = new EntityStorage(this);
    };

    EntityDAO.prototype.init = function () {
        return Q.Promise(function (resolve, reject) {
            if (this.meta) {
                localforage.setItem(this._metaStorageKey, this.meta, function (err, value) {
                    if (err) {
                        reject(err);
                    } else {
                        resolve(this);
                    }
                }.bind(this));
            } else {

                localforage.getItem(this._metaStorageKey, function (err, value) {
                    if (err) {
                        reject(err);
                    } else {
                        if (value) {
                            this.meta = value;
                            resolve(this);
                        } else {
                            reject("No offline metadata for model " + this.modelName);
                        }
                    }
                }.bind(this));
            }
        }.bind(this));
    };

    EntityDAO.prototype._deferAction = function (method, url, options) {
        return this.sdk._pushDeferredActionIntoQueue({
            "modelName": this.modelName,
            "method": method,
            "url": url,
            "options": options
        });
    };

    EntityDAO.prototype._performDeferredAction = function (action) {
        // Create with auto generated primary key
        if ("POST" === action.method) {
            var id = action.options.data[this.meta.idAttribute];
            if (_.isString(id) && id.indexOf("__tmp_entity_id__") !== -1) {
                delete action.options.data[this.meta.idAttribute];
                return this.sdk.ajax(action.method, action.url, action.options)
                    .then(function (data) {
                        this.store.set(data);
                        return new DeferredCreateActionResultData(id, data[this.meta.idAttribute], data);
                    }.bind(this))
                    ['finally'](function () {
                    this.store.evict(id);
                }.bind(this));
            }
        }

        // All other cases
        return this.sdk.ajax(action.method, action.url, action.options);
    };

    EntityDAO.prototype.create = function (content, options) {
        if (!this.meta.api.create || !this.meta.api.create.url) {
            return Q.reject("Action 'create' is not supported by model " + this.modelName);
        }

        options = options || {};

        try {
            this.validate(content);
        } catch (e) {
            return Q.reject(e);
        }

        options.data = content;
        options.contentType = options.contentType || "application/json";
        options = this.sdk._buildAjaxOptions(options);

        var urlParams = {};
        var url = this._processURL(this.meta.api.create.url, urlParams);

        if (this.sdk.isOffline()) {
            var id = options.data[this.meta.idAttribute];
            if (!_.isUndefined(id) && !_.isNull(id)) {
                if (this.store.get(id)) {
                    return Q.reject("Entity with id " + id + " already exists");
                }
            } else {
                // ID is auto generated on the server
                // Creating temporary id's that will be replaced with real one after synchronization
                options.data[this.meta.idAttribute] = "__tmp_entity_id__" + (Math.floor(Math.random() * 1e6 - 1) + 1e6);
            }

            return this._deferAction("POST", url, options).then(function () {
                this.store.set(options.data);
                return Q(options.data);
            }.bind(this));
        } else {
            return this.sdk.ajax("POST", url, options).then(function (obj) {
                try {
                    this.store.set(obj);
                    return Q(obj);
                } catch (e) {
                    return Q.reject(e.message);
                }
            }.bind(this));
        }
    };

    EntityDAO.prototype.get = function (id, options) {
        if (!this.meta.api.get || !this.meta.api.get.url) {
            return Q.reject("Action 'get' is not supported by model " + this.modelName);
        }

        if (_.isUndefined(id) || _.isNull(id)) {
            return Q.reject("Can't perform 'get' on " + this.modelName + ", object ID is empty");
        }

        if (this.sdk.isOffline()) {
            var obj = this.store.get(id);
            if (obj) {
                return Q(obj);
            } else {
                return Q.reject("Entity with id " + id + " not found in storage");
            }
        } else {
            options = options || {};
            options = this.sdk._buildAjaxOptions(options);
            var urlParams = {}, idURLParam = {};
            idURLParam[this.meta.idAttribute] = id;
            _.defaults(urlParams, this.sdk.urlParams, idURLParam);
            var url = this._processURL(this.meta.api.get.url, urlParams);

            return this.sdk.ajax("GET", url, options).then(function (obj) {
                try {
                    this.store.set(obj);
                    return Q(obj);
                } catch (e) {
                    return Q.reject(e.message);
                }
            }.bind(this));
        }
    };

    EntityDAO.prototype.update = function (id, content, options) {
        if (!this.meta.api.update || !this.meta.api.update.url) {
            return Q.reject("Action 'update' is not supported by model " + this.modelName);
        }

        if (_.isUndefined(id) || _.isNull(id)) {
            return Q.reject("Can't update entity by empty id");
        }

        try {
            this.validate(content);
        } catch (e) {
            return Q.reject(e);
        }

        options = options || {};
        options.data = _.omit(content, this.meta.idAttribute);

        if (_.isEmpty(options.data)) {
            return Q.reject("Can't update entity with nothing");
        }

        options.contentType = options.contentType || "application/json";
        options = this.sdk._buildAjaxOptions(options);

        var urlParams = {};
        urlParams[this.meta.idAttribute] = id;
        var url = this._processURL(this.meta.api.update.url, urlParams);

        if (this.sdk.isOffline()) {
            var obj = this.store.get(id);
            if (obj) {

                return this._deferAction("PUT", url, options).then(function () {
                    this.store.evict(id);
                    this.store.set(_.extend(obj, options.data)); // obj can be partially filled so we do _.extend()
                    return Q(obj);
                }.bind(this));
            } else {
                return Q.reject("Entity with id " + id + " not found");
            }
        } else {
            return this.sdk.ajax("PUT", url, options).then(function (obj) {
                try {
                    this.store.evict(id);
                    this.store.set(obj); // obj returned by server is self sufficient
                    return Q(obj);
                } catch (e) {
                    return Q.reject(e.message);
                }
            }.bind(this));
        }
    };

    EntityDAO.prototype['delete'] = function (id, options) {
        if (!this.meta.api['delete'] || !this.meta.api['delete'].url) {
            return Q.reject("Action 'delete' is not supported by model " + this.modelName);
        }

        if (_.isUndefined(id) || _.isNull(id)) {
            return Q.reject("Can't perform 'delete' on " + this.modelName + ", object ID is empty");
        }

        options = options || {};

        var urlParams = {}, idURLParam = {};
        idURLParam[this.meta.idAttribute] = id;
        _.defaults(urlParams, this.sdk.urlParams, idURLParam);
        var url = this._processURL(this.meta.api['delete'].url, urlParams);
        options = this.sdk._buildAjaxOptions(options);

        if (this.sdk.isOffline()) {
            var obj = this.store.get(id);
            if (obj) {
                return this._deferAction("DELETE", url, options).then(function () {
                    this.store.evict(id);
                    return Q(obj);
                }.bind(this));
            } else {
                return Q.reject("Entity with id " + id + " not found");
            }
        } else {
            return this.sdk.ajax("DELETE", url, options).then(function (data) {
                try {
                    this.store.evict(id);
                    return Q(data);
                } catch (e) {
                    return Q.reject(e.message);
                }
            }.bind(this));
        }
    };

    EntityDAO.prototype.getCount = function (where, options) {
        if (!this.meta.api.find || !this.meta.api.find.url) {
            return Q.reject("Action 'find' is not supported by model " + this.modelName);
        }
        where = where || {};
        options = options || {};

        var requestData = {
            "where": where,
            "count": true
        };

        var result = {};

        if (this.sdk.isOffline()) {
            try {
                result.count = this.store.find(requestData.where).length;
            } catch (ex) {
                return Q.reject("Internal SDK error occurs");
            }
            return Q(result);
        } else {
            var urlParams = {};

            var url = this._processURL(this.meta.api.find.url, urlParams);

            options = this.sdk._buildAjaxOptions(options);

            options.data = requestData;

            options.isDetailedAjaxResponceNeeded = true;

            return this.sdk.ajax("GET", url, options).then(function (detailedResponce) {
                var promise = Q();

                try {
                    if (_.isEmpty(where)) {
                        promise = promise.then(this.store.purge);
                    }
                    promise = promise.then(function () {
                        this.store.set(detailedResponce.data);
                        result.count = detailedResponce.httpRequest.getResponseHeader("X-Total-Count");
                        if (_.isUndefined(result.count) || _.isNull(result.count)) {
                            return Q.reject("Error getting count from server. Server returned empty count value.")
                        }
                        try {
                            result.count = parseInt(result.count);
                        } catch (ex) {
                            return Q.reject("Error getting count from server. Server returned invalid count value.")
                        }
                        return Q(result);
                    }.bind(this));
                } catch (e) {
                    promise.reject(e.message);
                }

                return promise;
            }.bind(this));
        }

    }

    EntityDAO.prototype.find = function (where, options) {
        if (!this.meta.api.find || !this.meta.api.find.url) {
            return Q.reject("Action 'find' is not supported by model " + this.modelName);
        }

        where = where || {};
        options = options || {};

        var requestData = {"where": where};

        if (!_.isUndefined(options.offset)) {
            if (!_.isNumber(options.offset)) {
                return Q.reject("Invalid offset option type. Should be a number.");
            }
            if (options.offset < 0) {
                return Q.reject("Invalid offset option value. Should not be negative.");
            }
            requestData.offset = options.offset;
        }

        if (!_.isUndefined(options.limit)) {
            if (!_.isNumber(options.limit)) {
                return Q.reject("Invalid limit option type. Should be a number.");
            }
            if (options.limit < 0) {
                return Q.reject("Invalid limit option value. Should not be negative.");
            }
            requestData.limit = options.limit;
        }

        if (this.sdk.isOffline()) {
            var findResult = this.store.find(requestData.where);
            if (!_.isUndefined(requestData.offset)) {
                findResult = _.slice(findResult, requestData.offset, findResult.length);
            }
            if (!_.isUndefined(requestData.limit) && requestData.limit < findResult.length) {
                findResult = _.take(findResult, requestData.limit);
            }
            return Q(findResult);
        } else {

            var urlParams = {};
            var url = this._processURL(this.meta.api.find.url, urlParams);

            options = this.sdk._buildAjaxOptions(options);

            options.data = requestData;
            return this.sdk.ajax("GET", url, options).then(function (data) {
                var promise = Q();

                try {
                    if (_.isEmpty(where)) {
                        promise = promise.then(this.store.purge);
                    }

                    promise = promise.then(function () {
                        this.store.set(data);
                        return Q(data);
                    }.bind(this));
                } catch (e) {
                    promise.reject(e.message);
                }

                return promise;
            }.bind(this));
        }
    };

    EntityDAO.prototype.validate = function (data) {
        if(!this.sdk.settings.isDataValidationEnabled){
            return;
        }
        if (!data) {
            throw new ValidationError("'data' is empty");
        }

        if (this.sdk.isOffline()) {
            var propetiesWithTempId = [];

            _.forOwn(data, function (value, key) {
                if (_.isString(value) && value.indexOf("__tmp_entity_id__") !== -1) {
                    propetiesWithTempId.push(key);
                }
            });

            var validationResult = tv4.validateMultiple(data, this.meta.schema, false, true);

            if (!validationResult.valid) {

                for (var i = 0; i < validationResult.errors.length; i++) {
                    var error = validationResult.errors[i];
                    var errorMessage;
                    errorMessage = error.message;
                    if (error.dataPath) {
                        var errorPropertyKey = error.dataPath.replace("/", "");
                        if (_.indexOf(propetiesWithTempId, errorPropertyKey) !== -1) {
                            continue;
                        } else {
                            errorMessage += ". Data Path: " + error.dataPath;
                            throw new ValidationError(errorMessage);
                        }
                    }

                }
            }
        } else {
            if (!tv4.validate(data, this.meta.schema, false, true)) {
                var error = tv4.error.message;
                if (tv4.error.dataPath) {
                    error += ". Data Path: " + tv4.error.dataPath;
                }
                throw new ValidationError(error);
            }
        }
    };

    EntityDAO.prototype._processURL = function (baseURL, parameters) {
        // TODO process URL - convert relative to absolute ones

        try {
            return baseURL.replace(/\{([^{}"':]+?)}/g, function (str, param) {
                if (!_.isUndefined(parameters[param]) && !_.isNull((parameters[param]))) {
                    return parameters[param];
                } else {
                    return str;
                }
            });
        } catch (e) {
            console.error("URL parameters substitution error: " + e.message);
            return baseURL;
        }
    };


// Entity storage

    var EntityStorage = function (dao) {
        _.bindAll(this, "set", "get", "evict", "find", "purge", "_loadCache", "_persistCache");
        this.dao = dao;
        this._dataStorageKey = "model-data:" + this.dao.modelName;

        this._loadCache();
        this._emitChange = _.debounce(function () {
            this.emit("change");
        }, 150);
        this.on("change", this._persistCache);
    };

    EntityStorage.prototype = _.clone(EventEmitter.prototype);

    EntityStorage.prototype.set = function (data) {
        if (_.isString(data)) {
            try {
                data = JSON.parse(data);
            } catch (e) {
                return new Error("'data' in not a valid JSON");
            }
        }

        var dataArray = _.isArray(data) ? data : [data];

        for (var i = 0, len = dataArray.length; i < len; i++) {
            var obj = dataArray[i];
            this._store[obj[this.dao.meta.idAttribute]] = obj;
        }

        this._emitChange();
    };

    EntityStorage.prototype.get = function (key) {
        if (key === undefined) {
            return undefined;
        } else if (_.isObject(key)) {
            throw new Error("Key must be a primitive");
        } else {
            // It's primitive key
            return this._store[key];
        }
    };

    EntityStorage.prototype.evict = function (key) {
        if (_.isObject(key)) {
            throw new Error("Key must be a primitive");
        } else {
            var result = delete this._store[key];
            this._emitChange();
            return result;
        }
    };

    EntityStorage.prototype.find = function (where) {
        where = where || {};
        if (_.isObject(where)) {
            return _.where(_.values(this._store), where);
        } else {
            throw new Error("Invalid query");
        }
    };

    EntityStorage.prototype.purge = function () {
        return Q.Promise(function (resolve, reject) {
            localforage.removeItem(this._dataStorageKey, function (err) {
                if (err) {
                    reject(err);
                } else {
                    this._store = {};
                    resolve();
                }
            }.bind(this));
        }.bind(this));
    };

    EntityStorage.prototype._persistCache = function () {
        return Q.Promise(function (resolve, reject) {
            localforage.setItem(this._dataStorageKey, this._store, function (err, value) {
                if (err) {
                    console.error(err);
                    reject(err);
                } else {
                    resolve(value);
                }
            }.bind(this));
        }.bind(this));
    };

    EntityStorage.prototype._loadCache = function () {
        return Q.Promise(function (resolve, reject) {
            localforage.getItem(this._dataStorageKey, function (err, value) {
                if (err) {
                    console.error(err);
                    reject(err);
                } else {
                    this._store = value || {};
                    resolve(value);
                }
            }.bind(this));
        }.bind(this));
    };

    // For now exposed AppClient is a singleton, but this approach may change in future
    return new AppClient();
}));
