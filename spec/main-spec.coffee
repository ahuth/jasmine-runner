JasmineRunnerPackage = require '../lib/main'

describe "JasmineRunnerPackage", ->
  describe "activation", ->
    it "creates a Jasmine Runner Controller", ->
      expect(JasmineRunnerPackage.jasmineRunnerController).toBeNull()
      JasmineRunnerPackage.activate()
      expect(JasmineRunnerPackage.jasmineRunnerController).not.toBeNull()

  describe "deactivation", ->
    beforeEach ->
      JasmineRunnerPackage.activate()

    it "destroys the Jasmine Runner Controller", ->
      expect(JasmineRunnerPackage.jasmineRunnerController).not.toBeNull()
      JasmineRunnerPackage.deactivate()
      expect(JasmineRunnerPackage.jasmineRunnerController).toBeNull()
