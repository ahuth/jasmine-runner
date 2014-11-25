CoffeescriptGrammar = require './coffeescript-grammar'
JavascriptGrammar = require './javascript-grammar'
NilGrammar = require './nil-grammar'

module.exports =
  for: (editor) ->
    editorGrammar = editor.getGrammar()
    switch editorGrammar.scopeName
      when "source.coffee" then CoffeescriptGrammar
      when "source.js" then JavascriptGrammar
      else NilGrammar
