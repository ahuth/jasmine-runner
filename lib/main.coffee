JasmineRunner = require './jasmine-runner'

module.exports =
  config:
    testServerUrl:
      type: 'string'
      default: 'http://localhost:8888'

  jasmineRunner: null

  activate: (state) ->
    @jasmineRunner = new JasmineRunner

  deactivate: ->
    @jasmineRunner.destroy()
    @jasmineRunner = null
