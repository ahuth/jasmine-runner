JasmineRunnerView = require './jasmine-runner-view'

module.exports =
  config:
    testServerUrl:
      type: 'string'
      default: 'http://localhost:8888'

  jasmineRunnerView: null

  activate: (state) ->
    @jasmineRunnerView = new JasmineRunnerView(state.jasmineRunnerViewState)

  deactivate: ->
    @jasmineRunnerView.destroy()

  serialize: ->
    jasmineRunnerViewState: @jasmineRunnerView.serialize()
