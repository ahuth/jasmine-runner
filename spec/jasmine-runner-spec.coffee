{WorkspaceView} = require 'atom'
JasmineRunner = require '../lib/jasmine-runner'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "JasmineRunner", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('jasmine-runner')

  describe "when the jasmine-runner:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.jasmine-runner')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'jasmine-runner:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.jasmine-runner')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'jasmine-runner:toggle'
        expect(atom.workspaceView.find('.jasmine-runner')).not.toExist()
