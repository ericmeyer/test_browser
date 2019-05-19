require "object-mothers/test"

class TestSummaryMother

  def self.with_tests(tests)
    return TestBrowser::TestSummary.new({ tests: tests })
  end

  def self.with_multiple_tests
    return TestBrowser::TestSummary.new({
      tests: [
        TestMother.passing_test("MyTest1"),
        TestMother.passing_test("MyTest2"),
        TestMother.failing_test("MyTest3"),
        TestMother.passing_test("MyTest4")
      ]
    })
  end

  def self.with_failing_tests
    return TestBrowser::TestSummary.new({
      tests: [
        TestMother.failing_test("MyTest1"),
        TestMother.passing_test("MyTest2"),
        TestMother.failing_test("MyTest3"),
        TestMother.failing_test("MyTest4")
      ]
    })
  end

  def self.with_all_passing_tests
    return TestBrowser::TestSummary.new({
      tests: [
        TestMother.passing_test("MyTest1"),
        TestMother.passing_test("MyTest2"),
        TestMother.passing_test("MyTest3"),
        TestMother.passing_test("MyTest4")
      ]
    })
  end

end
