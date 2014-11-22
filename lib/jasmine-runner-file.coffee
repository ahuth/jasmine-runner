JasmineRunnerLine = JasmineRunnerLine= require './jasmine-runner-line'

module.exports =
class JasmineRunnerFile
  constructor: (editor) ->
    @editor = editor
    @position = @editor.getCursorScreenPosition()
    @lines = @getLines()

  destroy: ->
    @editor = null
    @lines = null

  getLines: ->
    tokenizedLines = @editor.tokenizedLinesForScreenRows(0, @position.row)
    tokenizedLines.map (line) -> new JasmineRunnerLine(line)
