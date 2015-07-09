qr = require 'qr-image'
express = require 'express'

module.exports = ->
  app = express()

  app.get '/qr.svg', (req, res) ->
    {size, text} = req.query
    text or= ''
    size or= 5
    res.header 'Content-Type', 'text/html; charset=utf-8'
    qr.image(text, type: 'svg', size: size).pipe res

  port = process.env.PORT or 5810
  app.listen port, -> console.log "Listen on #{port}"
