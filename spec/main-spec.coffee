JasmineRunnerPackage = require '../lib/main'

describe "JasmineRunnerPackage", ->
  describe "activation", ->
    it "creates a Jasmine Runner", ->
      expect(JasmineRunnerPackage.jasmineRunner).toBeNull()
      JasmineRunnerPackage.activate()
      expect(JasmineRunnerPackage.jasmineRunner).not.toBeNull()

  describe "deactivation", ->
    beforeEach ->
      JasmineRunnerPackage.activate()

    it "destroys the Jasmine Runner Controller", ->
      expect(JasmineRunnerPackage.jasmineRunner).not.toBeNull()
      JasmineRunnerPackage.deactivate()
      expect(JasmineRunnerPackage.jasmineRunner).toBeNull()
