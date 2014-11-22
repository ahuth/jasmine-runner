module.exports =
class JasmineRunnerController
  constructor: (serializeState) ->
    @workspace = atom.workspace
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-file': => @_runFile()
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-test': => @_runTest()

  destroy: ->
    @workspace = null

  _runFile: ->

  _runTest: ->
