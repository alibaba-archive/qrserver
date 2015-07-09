qr = require 'qr-image'
express = require 'express'

module.exports = ->
  app = express()

  app.get '/qr.svg', (req, res) ->
    {size, text} = req.query
    text or= ''
    size = Number(size) or 5
    return res.end('Out of size') if text.length > 1024
    res.header 'Content-Type', 'text/html; charset=utf-8'
    qr.image(text, type: 'svg', size: size).pipe res

  app.get '/qr.png', (req, res) ->
    {size, text} = req.query
    text or= ''
    size = Number(size) or 5
    return res.end('Out of size') if text.length > 1024
    res.header 'Content-Type', 'image/jpeg'
    qr.image(text, type: 'png', size: size).pipe res

  port = process.env.PORT or 5810
  app.listen port, -> console.log "Listen on #{port}"
