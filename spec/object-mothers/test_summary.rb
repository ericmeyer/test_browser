class TestSummaryMother

  def self.with_multiple_tests
    return TestBrowser::TestSummary.new({
      tests: [
        TestBrowser::Test.new({
          name: "MyTest1",
          result: "passed"
        }),
        TestBrowser::Test.new({
          name: "MyTest2",
          result: "passed"
        }),
        TestBrowser::Test.new({
          details: [],
          name: "MyTest3",
          result: "failed"
        }),
        TestBrowser::Test.new({
          name: "MyTest4",
          result: "passed"
        })
      ]
    })
  end

  def self.with_failing_tests
    return TestBrowser::TestSummary.new({
      tests: [
        TestBrowser::Test.new({
          details: [],
          name: "MyTest1",
          result: "failed"
        }),
        TestBrowser::Test.new({
          name: "MyTest2",
          result: "passed"
        }),
        TestBrowser::Test.new({
          details: [],
          name: "MyTest3",
          result: "failed"
        }),
        TestBrowser::Test.new({
          details: [],
          name: "MyTest4",
          result: "failed"
        })
      ]
    })
  end

  def self.with_all_passing_tests
    return TestBrowser::TestSummary.new({
      tests: [
        TestBrowser::Test.new({
          name: "MyTest1",
          result: "passed"
        }),
        TestBrowser::Test.new({
          name: "MyTest2",
          result: "passed"
        }),
        TestBrowser::Test.new({
          name: "MyTest3",
          result: "passed"
        }),
        TestBrowser::Test.new({
          name: "MyTest4",
          result: "passed"
        })
      ]
    })
  end

end
