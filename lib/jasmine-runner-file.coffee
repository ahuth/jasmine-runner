module.exports =
class JasmineRunnerFile
  constructor: (editor) ->
    @editor = editor
    @position = @editor.getCursorScreenPosition()
    @lines = @editor.linesForScreenRows(0, @position.row)

  destroy: ->
    @editor = null
    @lines = null
