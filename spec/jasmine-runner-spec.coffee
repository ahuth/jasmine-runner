JasmineRunner = require '../lib/jasmine-runner'

describe "JasmineRunner", ->
  describe "activation", ->
    it "creates a Jasmine Runner Controller", ->
      expect(JasmineRunner.jasmineRunnerController).toBeNull()
      JasmineRunner.activate()
      expect(JasmineRunner.jasmineRunnerController).not.toBeNull()

  describe "deactivation", ->
    beforeEach ->
      JasmineRunner.activate()

    it "destroys the Jasmine Runner Controller", ->
      expect(JasmineRunner.jasmineRunnerController).not.toBeNull()
      JasmineRunner.deactivate()
      expect(JasmineRunner.jasmineRunnerController).toBeNull()
