shell = require 'shell'
JasmineRunnerFile = require './jasmine-runner-file'
JasmineRunnerNameGenerator = require './jasmine-runner-name-generator'
JasmineRunnerFileNameGenerator = require './jasmine-runner-file-name-generator'
JasmineRunnerCoffeescriptGrammar = require './grammars/coffeescript-grammar'
JasmineRunnerJavascriptGrammar = require './grammars/javascript-grammar'
JasmineRunnerNilGrammar = require './grammars/nil-grammar'

module.exports =
class JasmineRunnerController
  constructor: (serializeState) ->
    @workspace = atom.workspace
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-file': => @_runFile()
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-test': => @_runTest()

  destroy: ->
    @workspace = null

  _runFile: ->
    editor = @workspace.getActiveEditor()
    file = new JasmineRunnerFile(editor)
    tree = file.getLineTree()
    grammar = @_getGrammar(editor)
    generator = new JasmineRunnerFileNameGenerator(grammar)
    name = generator.generateName(tree)
    @_openBrowser(name)

  _runTest: ->
    editor = @workspace.getActiveEditor()
    file = new JasmineRunnerFile(editor)
    tree = file.getLineTree()
    grammar = @_getGrammar(editor)
    generator = new JasmineRunnerNameGenerator(grammar)
    name = generator.generateName(tree)
    @_openBrowser(name)

  _getGrammar: (editor) ->
    editorGrammar = editor.getGrammar()
    switch editorGrammar.scopeName
      when "source.coffee" then JasmineRunnerCoffeescriptGrammar
      when "source.js" then JasmineRunnerJavascriptGrammar
      else JasmineRunnerNilGrammar

  _openBrowser: (name) ->
    testServerUrl = atom.config.get("jasmine-runner.testServerUrl")
    fullUrl = "#{testServerUrl}/?spec=#{name}"
    shell.openExternal(fullUrl)
