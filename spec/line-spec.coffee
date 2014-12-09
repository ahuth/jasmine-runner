Line= require '../lib/line'

describe "Line", ->
  line1 = null
  line2 = null

  beforeEach ->
    waitsForPromise ->
      atom.workspace.open("example-spec.coffee")

    runs ->
      editor = atom.workspace.getActiveTextEditor()
      tokenizedLines = editor.tokenizedLinesForScreenRows(0)
      line1 = new Line(tokenizedLines[0])
      line2 = new Line(tokenizedLines[tokenizedLines.length - 2])

  it "has the text", ->
    expect(line1.text).toBe 'describe "An example CoffeeScript test suite", ->'
    expect(line2.text).toBe "expect(test1 - test2 / test3).toBe 1.4"

  it "has the indentation level", ->
    expect(line1.indentLevel).toBe 0
    expect(line2.indentLevel).toBe 4
