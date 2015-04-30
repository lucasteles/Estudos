express = require 'express'
app = new express
port = process.env.PORT or 4000

app.use express.static __dirname + '/'
app.listen port 