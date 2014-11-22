JasmineRunnerFile = require '../lib/jasmine-runner-file'

describe "JasmineRunnerFile", ->
  editor = null

  describe "CoffeeScript", ->
    beforeEach ->
      waitsForPromise ->
        atom.workspace.open("example-spec.coffee")

      runs ->
        editor = atom.workspace.getActiveEditor()

    it "gets the lines up to the cursor position", ->
      editor.setCursorScreenPosition({ column: 16, row: 12 })
      file = new JasmineRunnerFile(editor)
      expect(file.lines.length).toBe 13

      lineTexts = file.lines.map (line) -> line.text
      expect(lineTexts).toEqual [
        "describe \"An example CoffeeScript test suite\", ->"
        "test1 = null"
        "test2 = null"
        ""
        "beforeEach ->"
        "test1 = 2"
        "test2 = 3"
        ""
        "describe \"First group\", ->"
        "test3 = null"
        ""
        "beforeEach ->"
        "test3 = 4"
      ]

    it "gets the line tree from the cursor position to the top of the file", ->
      editor.setCursorScreenPosition({ column: 47, row: 38 })
      file = new JasmineRunnerFile(editor)

      lineTree = file.getLineTree().map (line) -> line.text
      expect(lineTree.length).toBe 5
      expect(lineTree).toEqual [
        "describe \"An example CoffeeScript test suite\", ->"
        "describe \"Second group\", ->"
        "describe \"Mixed operations\", ->"
        "it \"subtracts and divides them\", ->"
        "expect(test1 - test2 / test3).toBe 1.4"
      ]

  describe "JavaScript", ->
    beforeEach ->
      waitsForPromise ->
        atom.workspace.open("example-spec.js")

      runs ->
        editor = atom.workspace.getActiveEditor()

    it "gets the lines up to the cursor position", ->
      editor.setCursorScreenPosition({ column: 16, row: 12 })
      file = new JasmineRunnerFile(editor)
      expect(file.lines.length).toBe 13

      lineTexts = file.lines.map (line) -> line.text
      expect(lineTexts).toEqual [
        "describe(\"An examle JavaScript test suite\", function () {"
        "var test1 = null;"
        "var test2 = null;"
        ""
        "beforeEach(function () {"
        "test1 = 2;"
        "test2 = 3;"
        "});"
        ""
        "describe(\"First group\", function () {"
        "var test3 = null;"
        ""
        "beforeEach(function () {"
      ]

    it "gets the line tree from the cursor position to the top of the file", ->
      editor.setCursorScreenPosition({ column: 53, row: 48 })
      file = new JasmineRunnerFile(editor)

      lineTree = file.getLineTree().map (line) -> line.text
      expect(lineTree.length).toBe 5
      expect(lineTree).toEqual [
        "describe(\"An examle JavaScript test suite\", function () {"
        "describe(\"Second group\", function () {"
        "describe(\"Mixed operations\", function () {"
        "it(\"subtracts and divides them\", function () {"
        "expect(test1 - test2 / test3).toBe(1.4);"
      ]
