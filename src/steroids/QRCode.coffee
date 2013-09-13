open = require "open"

class QRCode

  constructor: (@options = {}) ->


  show: (options={})=>
    return if process.env.STEROIDS_TEST_RUN

    url = if options.showTestContent? and options.showTestContent
      "http://127.0.0.1:#{@options.port}/__appgyver/connect/qrcode_test.html?qrCodeData=#{encodeURIComponent(@options.data)}"
    else
      "http://127.0.0.1:#{@options.port}/__appgyver/connect/qrcode.html?qrCodeData=#{encodeURIComponent(@options.data)}"

	open url
    steroidsCli.debug "Opening URL #{url}" in default web browser..."

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
