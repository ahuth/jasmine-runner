Browser = require './browser'
File = require './file'
TestNameGenerator = require './generators/test-name-generator'
FileNameGenerator = require './generators/file-name-generator'
GrammarFactory = require './grammars/grammar-factory'

module.exports =
class JasmineRunner
  constructor: (serializeState) ->
    @workspace = atom.workspace
    @browser = new Browser
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-file': => @_runFile()
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-test': => @_runSingle()

  destroy: ->
    @workspace = null
    @browser = null

  _runFile: ->
    editor = @workspace.getActiveEditor()
    Grammar = GrammarFactory.for(editor)
    @_runTests(editor, Grammar, FileNameGenerator)

  _runSingle: ->
    editor = @workspace.getActiveEditor()
    Grammar = GrammarFactory.for(editor)
    @_runTests(editor, Grammar, TestNameGenerator)

  _runTests: (editor, Grammar, Generator) ->
    file = new File(editor)
    tree = file.getTree()
    generator = new Generator(Grammar)
    name = generator.generateName(tree)
    @browser.open(name) if name?
