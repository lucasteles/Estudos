http = require 'http'
io = require 'socket.io'
express = require 'express'
easyrtc = require 'easyrtc' 


class Server

    constructor: -> @setUp()
    
    setUp: ->
        try
            httpApp = express()
            
            httpApp.set 'port', (process.env.PORT or 3000)
            httpApp.use express.static "#{__dirname}/"

            webServer = http
            			.createServer(httpApp)
            			.listen (process.env.PORT or 3000)


            socketServer = io.listen webServer, {'log level': 1}
            easyrtc.listen httpApp, socketServer
        catch err
            console.error err.message, err.stack



new Server