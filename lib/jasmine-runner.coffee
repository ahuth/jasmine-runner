shell = require 'shell'
File = require './file'
TestNameGenerator = require './generators/test-name-generator'
FileNameGenerator = require './generators/file-name-generator'
CoffeescriptGrammar = require './grammars/coffeescript-grammar'
JavascriptGrammar = require './grammars/javascript-grammar'
NilGrammar = require './grammars/nil-grammar'

module.exports =
class JasmineRunner
  constructor: (serializeState) ->
    @workspace = atom.workspace
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-file': => @_runFile()
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-test': => @_runSingle()

  destroy: ->
    @workspace = null

  _runFile: ->
    editor = @workspace.getActiveEditor()
    Grammar = @_getGrammar(editor)
    @_runTests(editor, Grammar, FileNameGenerator)

  _runSingle: ->
    editor = @workspace.getActiveEditor()
    Grammar = @_getGrammar(editor)
    @_runTests(editor, Grammar, TestNameGenerator)

  _runTests: (editor, Grammar, Generator) ->
    file = new File(editor)
    tree = file.getLineTree()
    generator = new Generator(Grammar)
    name = generator.generateName(tree)
    @_openBrowser(name)

  _getGrammar: (editor) ->
    editorGrammar = editor.getGrammar()
    switch editorGrammar.scopeName
      when "source.coffee" then CoffeescriptGrammar
      when "source.js" then JavascriptGrammar
      else NilGrammar

  _openBrowser: (name) ->
    testServerUrl = atom.config.get("jasmine-runner.testServerUrl")
    fullUrl = "#{testServerUrl}/?spec=#{name}"
    shell.openExternal(fullUrl)
