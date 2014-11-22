JasmineRunnerController = require './jasmine-runner-controller'

module.exports =
  config:
    testServerUrl:
      type: 'string'
      default: 'http://localhost:8888'

  jasmineRunnerController: null

  activate: (state) ->
    @jasmineRunnerController = new JasmineRunnerController

  deactivate: ->
    @jasmineRunnerController.destroy()
