TestNameGenerator = require '../../lib/generators/test-name-generator'

describe "TestNameGenerator", ->
  lineTree = null
  nameGenerator = null

  class FakeGrammar
    match: (lineText) ->
      match = lineText.match(/"(.+)"/)
      { isMatch: true, name: match?[1] }

  beforeEach ->
    nameGenerator = new TestNameGenerator(FakeGrammar)

  it "creates a name from a line tree", ->
    lineTree = [
      { text: "describe \"An example CoffeeScript test suite\", ->" }
      { text: "describe \"Second group\", ->" }
      { text: "describe \"Mixed operations\", ->" }
      { text: "it \"subtracts and divides them\", ->" }
    ]
    expect(nameGenerator.generateName(lineTree)).toBe "An example CoffeeScript test suite Second group Mixed operations subtracts and divides them"

  it "handles lines that don't have a 'name'", ->
    lineTree = [
      { text: "describe \"An example CoffeeScript test suite\", ->" }
      { text: "describe \"Second group\", ->" }
      { text: "describe \"Mixed operations\", ->" }
      { text: "no match" }
      { text: "it \"subtracts and divides them\", ->" }
    ]
    expect(nameGenerator.generateName(lineTree)).toBe "An example CoffeeScript test suite Second group Mixed operations subtracts and divides them"
