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

      lineTexts = file.lines.map (tokenizedLine) -> tokenizedLine.text.trim()
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
