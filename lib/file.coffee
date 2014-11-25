Line = require './line'

module.exports =
class File
  constructor: (editor) ->
    @editor = editor
    @position = @editor.getCursorScreenPosition()
    @lines = @getLines()

  destroy: ->
    @editor = null
    @lines = null

  getLines: ->
    tokenizedLines = @editor.tokenizedLinesForScreenRows(0, @position.row)
    tokenizedLines.map (line) -> new Line(line)

  getTree: ->
    reversedTree = []
    @_traverseUpTree (line) -> reversedTree.push(line)
    reversedTree.reverse()

  getLastLine: ->
    @lines[@lines.length - 1]

  _traverseUpTree: (callback) ->
    lastLine = @getLastLine()
    currentIndentLevel = lastLine.indentLevel
    callback(lastLine)
    for line in @lines by -1
      if line.indentLevel < currentIndentLevel
        currentIndentLevel = line.indentLevel
        callback(line)
