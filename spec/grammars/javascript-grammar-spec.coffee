JavascriptGrammar = require '../../lib/grammars/javascript-grammar'

describe "JavaScript grammar", ->
  grammar = null

  beforeEach ->
    grammar = new JavascriptGrammar

  it "matches describe", ->
    match = grammar.match('describe("described", function ()')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "described"

  it "Matches fdescribe", ->
    match = grammar.match('fdescribe("fdescribed", function ()')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "fdescribed"

  it "matches xdescribe", ->
    match = grammar.match('xdescribe("xdescribed", function ()')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "xdescribed"

  it "matches context", ->
    match = grammar.match('context("contexted", function ()')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "contexted"

  it "matches fcontext", ->
    match = grammar.match('fcontext("fcontexted", function ()')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "fcontexted"

  it "matches xcontext", ->
    match = grammar.match('xcontext("xcontexted", function ()')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "xcontexted"

  it "matches it", ->
    match = grammar.match('it("itted", function ()')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "itted"

  it "matches fit", ->
    match = grammar.match('fit("fitted", function ()')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "fitted"

  it "matches xit", ->
    match = grammar.match('xit("xitted", function ()')
    expect(match.isMatch).toBe true
    expect(match.name).toBe "xitted"

  it "does not match anything else", ->
    match = grammar.match('lift("lifted", function ()')
    expect(match.isMatch).toBe false

  it "matches when there is no whitespace after the function keyword", ->
    match = grammar.match("describe('#initIndex', function() {")
    expect(match.isMatch).toBe true
