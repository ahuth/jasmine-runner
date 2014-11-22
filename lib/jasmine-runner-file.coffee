JasmineRunnerLine = JasmineRunnerLine= require './jasmine-runner-line'

module.exports =
class JasmineRunnerFile
  constructor: (editor) ->
    @editor = editor
    @position = @editor.getCursorScreenPosition()
    tokenizedLines = @editor.tokenizedLinesForScreenRows(0, @position.row)
    @lines = tokenizedLines.map (line) -> new JasmineRunnerLine(line)

  destroy: ->
    @editor = null
    @lines = null
