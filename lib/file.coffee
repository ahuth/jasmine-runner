module.exports =
class File
  constructor: (editor) ->
    @editor = editor
    @position = @editor.getCursorBufferPosition()

  destroy: ->
    @editor = null
    @lines = null

  getTree: ->
    tree = []
    currentIndentLevel = @editor.indentationForBufferRow(@position.row)

    tree.push
      text: @editor.lineTextForBufferRow(@position.row).trim()
      indentLevel: currentIndentLevel

    for row in [@position.row..0]
      text = @editor.lineTextForBufferRow(row).trim()
      indentLevel = @editor.indentationForBufferRow(row)

      if text && indentLevel < currentIndentLevel
        tree.push
          text: text
          indentLevel: indentLevel
        currentIndentLevel = indentLevel

    tree.reverse()
