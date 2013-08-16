open = require "open"

class QRCode

  constructor: (@options = {}) ->


  show: (options={})=>
    return if process.env.STEROIDS_TEST_RUN
    if options.showTestContent? and options.showTestContent
      open "http://localhost:#{@options.port}/__appgyver/connect/qrcode.html?qrCodeData=#{encodeURIComponent(@options.data)}&test=true"
    else
      open "http://localhost:#{@options.port}/__appgyver/connect/qrcode.html?qrCodeData=#{encodeURIComponent(@options.data)}"

  @showLocal: (options={}) =>
    interfaces = steroidsCli.server.interfaces()
    ips = steroidsCli.server.ipAddresses()

    encodedJSONIPs = encodeURIComponent(JSON.stringify(ips))
    encodedPort = encodeURIComponent(options.port)

    code = new QRCode
      data: "appgyver://?ips=#{encodedJSONIPs}&port=#{encodedPort}"
      port: options.port

    code.show(options)





module.exports = QRCode
