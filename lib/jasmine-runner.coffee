JasmineRunnerView = require './jasmine-runner-view'

module.exports =
  jasmineRunnerView: null

  activate: (state) ->
    @jasmineRunnerView = new JasmineRunnerView(state.jasmineRunnerViewState)

  deactivate: ->
    @jasmineRunnerView.destroy()

  serialize: ->
    jasmineRunnerViewState: @jasmineRunnerView.serialize()
