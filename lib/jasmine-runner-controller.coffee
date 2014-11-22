JasmineRunnerFile = require './jasmine-runner-file'
JasmineRunnerNameGenerator = require './jasmine-runner-name-generator'
JasmineRunnerCoffeescriptGrammar = require './grammars/coffeescript-grammar'
JasmineRunnerJavascriptGrammar = require './grammars/javascript-grammar'

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
    editor = @workspace.getActiveEditor()
    file = new JasmineRunnerFile(editor)
    tree = file.getLineTree()
    grammar = @_getGrammar(editor)
    generator = new JasmineRunnerNameGenerator(grammar)
    name = generator.generateName(tree)
    console.log name

  _getGrammar: (editor) ->
    editorGrammar = editor.getGrammar()
    switch editorGrammar.scopeName
      when "source.coffee" then JasmineRunnerCoffeescriptGrammar
      when "source.js" then JasmineRunnerJavascriptGrammar
