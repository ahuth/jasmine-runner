grammarFactory = require '../../lib/grammars/grammar-factory'

describe "GrammarFactory", ->
  editor = null

  describe "CoffeeScript", ->
    beforeEach ->
      waitsForPromise ->
        atom.packages.activatePackage("language-coffee-script")

      waitsForPromise ->
        atom.workspace.open("example-spec.coffee")

      runs ->
        editor = atom.workspace.getActiveTextEditor()

    it "gets the correct grammar", ->
      grammar = grammarFactory.for(editor)
      expect(grammar.name).toBe "CoffeescriptGrammar"

  describe "JavaScript", ->
    beforeEach ->
      waitsForPromise ->
        atom.packages.activatePackage("language-javascript")

      waitsForPromise ->
        atom.workspace.open("example-spec.js")

      runs ->
        editor = atom.workspace.getActiveTextEditor()

    it "gets the correct grammar", ->
      grammar = grammarFactory.for(editor)
      expect(grammar.name).toBe "JavascriptGrammar"

  describe "other file types", ->
    beforeEach ->
      editor =
        getGrammar: ->
          { scopeName: "source.x" }

    it "gets the nil grammar", ->
      grammar = grammarFactory.for(editor)
      expect(grammar.name).toBe "NilGrammar"
