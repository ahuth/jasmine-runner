FileNameGenerator = require '../../lib/generators/file-name-generator'

describe "FileNameGenerator", ->
  lineTree = null
  nameGenerator = null

  class FakeGrammar
    match: (lineText) ->
      match = lineText.match(/"(.+)"/)
      { isMatch: true, name: match?[1] }

  beforeEach ->
    nameGenerator = new FileNameGenerator(FakeGrammar)

  it "creates a name from a line tree", ->
    lineTree = [
      { text: "describe \"An example CoffeeScript test suite\", ->" }
      { text: "describe \"Second group\", ->" }
      { text: "describe \"Mixed operations\", ->" }
      { text: "it \"subtracts and divides them\", ->" }
    ]
    expect(nameGenerator.generateName(lineTree)).toBe "An example CoffeeScript test suite"

  it "handles lines that don't have a 'name'", ->
    lineTree = [
      { text: "no match" }
      { text: "describe \"An example CoffeeScript test suite\", ->" }
      { text: "describe \"Second group\", ->" }
      { text: "describe \"Mixed operations\", ->" }
      { text: "it \"subtracts and divides them\", ->" }
    ]
    expect(nameGenerator.generateName(lineTree)).toBe "An example CoffeeScript test suite"
