CoffeescriptGrammar = require '../../lib/grammars/coffeescript-grammar'

describe "CoffeeScript grammar", ->
  grammar = null

  beforeEach ->
    grammar = new CoffeescriptGrammar

  it "matches describe", ->
    match = grammar.match('describe "described", ->')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "described"

  it "Matches fdescribe", ->
    match = grammar.match('fdescribe "fdescribed", ->')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "fdescribed"

  it "matches xdescribe", ->
    match = grammar.match('xdescribe "xdescribed", ->')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "xdescribed"

  it "matches context", ->
    match = grammar.match('context "contexted", ->')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "contexted"

  it "matches fcontext", ->
    match = grammar.match('fcontext "fcontexted", ->')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "fcontexted"

  it "matches xcontext", ->
    match = grammar.match('xcontext "xcontexted", ->')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "xcontexted"

  it "matches it", ->
    match = grammar.match('it "itted", ->')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "itted"

  it "matches fit", ->
    match = grammar.match('fit "fitted", ->')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "fitted"

  it "matches xit", ->
    match = grammar.match('xit "xitted", ->')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "xitted"

  it "does not match anything else", ->
    match = grammar.match('qwerty = (asdf) ->')
    expect(match.isMatch).toBe false
