describe "An example CoffeeScript test suite", ->
  test1 = null
  test2 = null

  beforeEach ->
    test1 = 2
    test2 = 3

  describe "First group", ->
    test3 = null

    beforeEach ->
      test3 = 4

    it "adds them", ->
      expect(test1 + test2 + test3).toBe 9

    it "multiplies them", ->
      expect(test1 * test2 * test3).toBe 24

    describe "Mixed operations", ->
      it "adds and multiplies them", ->
        expect(test1 + test2 * test3).toBe 14

  describe "Second group", ->
    test3 = null

    beforeEach ->
      test3 = 5

    it "subtracts them", ->
      expect(test1 - test2 - test3).toBe -6

    it "divides them", ->
      expect(test1 / test2 / test3).toBe 0.13333333333333333

    describe "Mixed operations", ->
      it "subtracts and divides them", ->
        expect(test1 - test2 / test3).toBe 1.4
