browser = require './browser'
grammarFactory = require './grammars/grammar-factory'
File = require './file'
FileNameGenerator = require './generators/file-name-generator'
TestNameGenerator = require './generators/test-name-generator'

module.exports =
class JasmineRunner
  constructor: (serializeState) ->
    @workspace = atom.workspace
    @subscriptions = []
    @subscriptions.push atom.commands.add 'atom-workspace', 'jasmine-runner:run-file': => @_runFile()
    @subscriptions.push atom.commands.add 'atom-workspace', 'jasmine-runner:run-test': => @_runSingle()

  destroy: ->
    subscription.dispose() for subscription in @subscriptions

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
