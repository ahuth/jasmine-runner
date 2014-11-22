module.exports =
class JavascriptGrammar
  pattern: ///
    ^\s*                # Match whitespace from the beginning of the line
    [fx]?               # Match an optional f (focus) or x (disable)
    (?:describe|context|it)   # Match one of the Jasmine functions
    \(                  # Match an opening parenthese
    \s?                 # Match whitespace after the Jasmine function
    ["']([^"']+)["']    # Capture the name of the block, not uncluding quotes
    \s*                 # Match whitespace after the block name
    ,\sfunction\s+\(\)  # Match the function keyword
  ///

  constructor: ->
    @isMatch = undefined
    @name = undefined

  match: (lineText) ->
    match = @_findMatch(lineText)
    {
      isMatch: match?
      name: match?[1]
    }

  _findMatch: (lineText) ->
    match = lineText.match(@pattern)
    return undefined unless match
    match