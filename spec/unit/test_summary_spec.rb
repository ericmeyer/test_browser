require "test_browser/test_summary"
require "object-mothers/test"

describe TestBrowser::TestSummary do

  def build_summary(results)
    return TestBrowser::TestSummary.build_summary(results)
  end

  describe "Building the test summary" do
    context "when there are no tests" do
      it "has no test names" do
        summary = build_summary({
          "tests": []
        })

        expect(summary.test_names).to eq([])
      end
    end

    context "when there is one test" do
      it "returns the only test name" do
        summary = build_summary({
          "tests" => [{
            "name" => "foobar",
            "result" => "passed"
          }]
        })

        expect(summary.test_names).to eq(["foobar"])
      end
    end

    context "when there is one failing test" do
      it "builds the summary with the details" do
        failure_details = [
          "Detail1",
          "Detail2"
        ]
        summary = build_summary({
          "tests" => [{
            "details" => failure_details,
            "name" => "foobar",
            "result" => "passed"
          }]
        })

        expect(summary.tests[0].details).to eq(failure_details)
      end
    end
  end

  describe "A test summary with no tests" do
    it "has no tests" do
      summary = TestBrowser::TestSummary.new(tests: [])
      expect(summary.tests).to eq([])
    end

    it "has no passing tests" do
      summary = TestBrowser::TestSummary.new(tests: [])
      expect(summary.passing_test_count).to eq(0)
    end

    it "has no failing tests" do
      summary = TestBrowser::TestSummary.new(tests: [])
      expect(summary.failing_tests).to eq([])
    end
  end

  describe "A test summary with only passing tests" do
    it "has the given tests" do
      summary = TestBrowser::TestSummary.new(tests: [
        TestMother.passing_test("Test1"),
        TestMother.passing_test("Test2")
      ])
      expect(summary.tests.map(&:name)).to eq(["Test1", "Test2"])
    end

    it "has two passing tests" do
      summary = TestBrowser::TestSummary.new(tests: [
        TestMother.passing_test("Test1"),
        TestMother.passing_test("Test2")
      ])
      expect(summary.passing_test_count).to eq(2)
    end

    it "has no failing tests" do
      summary = TestBrowser::TestSummary.new(tests: [
        TestMother.passing_test("Test1"),
        TestMother.passing_test("Test2")
      ])
      expect(summary.failing_tests).to eq([])
    end
  end

  describe "A test summary with both passing and failing tests" do
    it "has the given tests" do
      summary = TestBrowser::TestSummary.new(tests: [
        TestMother.passing_test("Passing1"),
        TestMother.failing_test("Failing1"),
        TestMother.passing_test("Passing2")
      ])
      expect(summary.tests.map(&:name)).to eq(["Passing1", "Failing1", "Passing2"])
    end

    it "has two passing tests" do
      summary = TestBrowser::TestSummary.new(tests: [
        TestMother.passing_test("Passing1"),
        TestMother.failing_test("Failing1"),
        TestMother.passing_test("Passing2")
      ])
      expect(summary.passing_test_count).to eq(2)
    end

    it "has one failing test" do
      summary = TestBrowser::TestSummary.new(tests: [
        TestMother.passing_test("Passing1"),
        TestMother.failing_test("Failing1"),
        TestMother.passing_test("Passing2")
      ])
      expect(summary.failing_tests.map(&:name)).to eq(["Failing1"])
    end
  end

  describe "A test summary with a skipped test" do
    it "has the given tests" do
      summary = TestBrowser::TestSummary.new(tests: [
        TestMother.passing_test("Passing"),
        TestMother.failing_test("Failing"),
        TestMother.skipped_test("Skipped")
      ])
      expect(summary.tests.map(&:name)).to eq(["Passing", "Failing", "Skipped"])
    end

    it "does not count skipped as passing" do
      summary = TestBrowser::TestSummary.new(tests: [
        TestMother.passing_test("Passing"),
        TestMother.failing_test("Failing"),
        TestMother.skipped_test("Skipped")
      ])
      expect(summary.passing_test_count).to eq(1)
    end

    it "does not count skipped as failing" do
      summary = TestBrowser::TestSummary.new(tests: [
        TestMother.passing_test("Passing"),
        TestMother.failing_test("Failing"),
        TestMother.skipped_test("Skipped")
      ])
      expect(summary.failing_tests.map(&:name)).to eq(["Failing"])
    end
  end

end
