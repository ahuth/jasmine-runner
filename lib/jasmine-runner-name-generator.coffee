module.exports =
class JasmineRunnerCoffeeNameGenerator
  constructor: (Grammar) ->
    @grammar = new Grammar

  generateName: (tree) ->
    names = tree.map (treeLine) =>
      @grammar.match(treeLine.text).name || ""
    names.join(" ")
