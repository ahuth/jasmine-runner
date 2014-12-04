shell = require 'shell'

makeTestUrl = (name) ->
  testServer = getTestServer()
  escapedName = escapeUrl(name)
  "#{testServer}/?spec=#{escapedName}"

getTestServer = ->
  atom.config.get("jasmine-runner.testServerUrl") or "http://localhost:8888"

escapeUrl = (url) ->
  url.replace("%", "%25")
     .replace("#", "%23")
     .replace("?", "%22")

module.exports =
  open: (name) ->
    url = makeTestUrl(name)
    shell.openExternal(url)
