shell = require 'shell'

module.exports =
class Browser
  open: (name) ->
    url = @_makeTestUrl(name)
    shell.openExternal(url)

  _makeTestUrl: (name) ->
    testServer = @_getTestServer()
    "#{testServer}/?spec=#{name}"

  _getTestServer: ->
    atom.config.get("jasmine-runner.testServerUrl") or "http://localhost:8888"
