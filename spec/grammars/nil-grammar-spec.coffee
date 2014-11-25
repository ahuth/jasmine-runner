NilGrammar = require '../../lib/grammars/nil-grammar'

describe "nil grammar", ->
  grammar = null

  beforeEach ->
    grammar = new NilGrammar

  it "does not match anything", ->
    match = grammar.match('describe "described", ->')
    expect(match.isMatch).toBe false

    match = grammar.match('describe("described", function ()')
    expect(match.isMatch).toBe false
