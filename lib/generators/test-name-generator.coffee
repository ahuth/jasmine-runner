module.exports =
class TestNameGenerator
  constructor: (Grammar) ->
    @grammar = new Grammar

  generateName: (tree) ->
    matches = tree.map (treeLine) => @grammar.match(treeLine.text).name
    names = matches.filter (match) -> match?
    names.join(" ")
