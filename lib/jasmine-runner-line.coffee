module.exports =
class JasmineRunnerLine
  constructor: (tokenizedLine) ->
    @tokenizedLine = tokenizedLine
    @text = @tokenizedLine.text.trim()
    @indentLevel = @tokenizedLine.indentLevel

  destroy: ->
    @tokenizedLine = null
