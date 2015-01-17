browser = require './browser'
grammarFactory = require './grammars/grammar-factory'
File = require './file'
FileNameGenerator = require './generators/file-name-generator'
TestNameGenerator = require './generators/test-name-generator'
{CompositeDisposable} = require 'event-kit'

module.exports =
class JasmineRunner
  constructor: (serializeState) ->
    @workspace = atom.workspace
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'jasmine-runner:run-file': => @_runFile()
    @subscriptions.add atom.commands.add 'atom-workspace', 'jasmine-runner:run-test': => @_runSingle()

  destroy: ->
    @subscriptions.dispose()

  _runFile: ->
    editor = @workspace.getActiveTextEditor()
    Grammar = grammarFactory.for(editor)
    @_runTests(editor, Grammar, FileNameGenerator)

  _runSingle: ->
    editor = @workspace.getActiveTextEditor()
    Grammar = grammarFactory.for(editor)
    @_runTests(editor, Grammar, TestNameGenerator)

  _runTests: (editor, Grammar, Generator) ->
    file = new File(editor)
    tree = file.getTree()
    generator = new Generator(Grammar)
    name = generator.generateName(tree)
    browser.open(name) if name?
