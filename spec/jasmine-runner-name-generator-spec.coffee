JasmineRunnerNameGenerator = require '../lib/jasmine-runner-name-generator'

describe "JasmineRunnerNameGenerator", ->
  lineTree = null
  nameGenerator = null

  class FakeGrammar
    match: (lineText) ->
      { isMatch: true, name: lineText.match(/"(.+)"/)[1] }

  beforeEach ->
    lineTree = [
      { text: "describe \"An example CoffeeScript test suite\", ->" }
      { text: "describe \"Second group\", ->" }
      { text: "describe \"Mixed operations\", ->" }
      { text: "it \"subtracts and divides them\", ->" }
    ]
    nameGenerator = new JasmineRunnerNameGenerator(FakeGrammar)

  it "creates a name from a line tree", ->
    expect(nameGenerator.generateName(lineTree)).toBe "An example CoffeeScript test suite Second group Mixed operations subtracts and divides them"
