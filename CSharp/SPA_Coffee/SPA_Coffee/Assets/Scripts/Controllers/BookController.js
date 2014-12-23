'use strict';
var BookController;

BookController = (function() {
  function BookController() {}

  BookController.prototype.load = function(callback) {
    this.__ajax("", "GET", function(data) {
      callback(data);
    });
  };

  BookController.prototype.find = function(id, callback) {
    this.__ajax(id, "GET", function(data) {
      callback(data);
    });
  };

  BookController.prototype.edit = function(book, callback) {
    this.__ajax(book.id, "PUT", function(data) {
      callback(data);
    }, book);
  };

  BookController.prototype.insert = function(book, callback) {
    this.__ajax("", "POST", function(data) {
      callback(data);
    }, book);
  };

  BookController.prototype.remove = function(id, callback) {
    this.__ajax(id, "DELETE", function(data) {
      callback(data);
    });
  };

  return BookController;

})();

BookController.prototype.__ajax = function(action, Type, callback, Data) {
  $.ajax({
    url: "/api/Books/" + action,
    dataType: "json",
    type: Type,
    contentType: 'application/json',
    data: Data != null ? JSON.stringify(Data) : "",
    success: function(data) {
      callback(data);
    },
    error: function(error) {
      callback(null, error);
    }
  });
};
