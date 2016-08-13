module.exports =
class File
  constructor: (editor) ->
    @editor = editor
    @position = @editor.getCursorBufferPosition()

  getTree: ->
    tree = []
    currentIndentLevel = @_getIndent(@position.row)

    tree.push
      text: @_getText(@position.row)
      indentLevel: currentIndentLevel

    for row in [@position.row..0]
      text = @_getText(row)
      indentLevel = @_getIndent(row)

      if text && indentLevel < currentIndentLevel
        currentIndentLevel = indentLevel
        tree.push
          text: text
          indentLevel: indentLevel

    tree.reverse()

  _getIndent: (row) ->
    @editor.indentationForBufferRow(row)

  _getText: (row) ->
    @editor.lineTextForBufferRow(row).trim()
