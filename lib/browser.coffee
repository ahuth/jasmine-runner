shell = require 'shell'

makeTestUrl = (name) ->
  testServer = getTestServer()
  "#{testServer}/?spec=#{name}"

getTestServer = ->
  atom.config.get("jasmine-runner.testServerUrl") or "http://localhost:8888"

module.exports =
  open: (name) ->
    url = makeTestUrl(name)
    shell.openExternal(url)
