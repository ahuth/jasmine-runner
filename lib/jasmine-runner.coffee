browser = require './browser'
grammarFactory = require './grammars/grammar-factory'
File = require './file'
TestNameGenerator = require './generators/test-name-generator'
FileNameGenerator = require './generators/file-name-generator'

module.exports =
class JasmineRunner
  constructor: (serializeState) ->
    @workspace = atom.workspace
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-file': => @_runFile()
    atom.commands.add 'atom-workspace', 'jasmine-runner:run-test': => @_runSingle()

  destroy: ->
    @workspace = null
    @browser = null

  _runFile: ->
    editor = @workspace.getActiveEditor()
    Grammar = grammarFactory.for(editor)
    @_runTests(editor, Grammar, FileNameGenerator)

  _runSingle: ->
    editor = @workspace.getActiveEditor()
    Grammar = grammarFactory.for(editor)
    @_runTests(editor, Grammar, TestNameGenerator)

  _runTests: (editor, Grammar, Generator) ->
    file = new File(editor)
    tree = file.getTree()
    generator = new Generator(Grammar)
    name = generator.generateName(tree)
    browser.open(name) if name?
