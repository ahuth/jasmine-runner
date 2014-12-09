JasmineRunner = require '../lib/jasmine-runner'
browser = require '../lib/browser'

describe "JasmineRunner", ->
  editor = null
  jasmineRunner = null
  view = null

  beforeEach ->
    jasmineRunner = new JasmineRunner
    view = atom.views.getView(atom.workspace)
    spyOn(browser, "open")

    waitsForPromise ->
      atom.packages.activatePackage("language-coffee-script")

    waitsForPromise ->
      atom.workspace.open("example-spec.coffee")

    runs ->
      editor = atom.workspace.getActiveTextEditor()
      editor.setCursorScreenPosition({ column: 43, row: 15 })

  it "opens the browser with the correct url for a single test", ->
    atom.commands.dispatch(view, "jasmine-runner:run-test")
    expect(browser.open).toHaveBeenCalledWith("An example CoffeeScript test suite First group adds them")

  it "opens the browser with the correct url for a test file", ->
    atom.commands.dispatch(view, "jasmine-runner:run-file")
    expect(browser.open).toHaveBeenCalledWith("An example CoffeeScript test suite")
