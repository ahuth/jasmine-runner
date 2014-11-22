module.exports =
class JasmineRunnerController
  constructor: (serializeState) ->
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-file': => @_runFile()
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-test': => @_runTest()

  destroy: ->

  _runFile: ->

  _runTest: ->
