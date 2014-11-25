describe("An example JavaScript test suite", function () {
  var test1 = null;
  var test2 = null;

  beforeEach(function () {
    test1 = 2;
    test2 = 3;
  });

  describe("First group", function () {
    var test3 = null;

    beforeEach(function () {
      test3 = 4;
    });

    it("adds them", function () {
      expect(test1 + test2 + test3).toBe(9);
    });

    it("multiplies them", function () {
      expect(test1 * test2 * test3).toBe(24);
    });

    describe("Mixed operations", function () {
      it("adds and multiplies them", function () {
        expect(test1 + test2 * test3).toBe(14);
      });
    });
  });

  describe("Second group", function () {
    var test3 = null;

    beforeEach(function () {
      test3 = 5;
    });

    it("subtracts them", function () {
      expect(test1 - test2 - test3).toBe(-6);
    });

    it("divides them", function () {
      expect(test1 / test2 / test3).toBe(0.13333333333333333);
    });

    describe("Mixed operations", function () {
      it("subtracts and divides them", function () {
        expect(test1 - test2 / test3).toBe(1.4);
      });
    });
  });
});
