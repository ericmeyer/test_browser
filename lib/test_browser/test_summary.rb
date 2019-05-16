require "test_browser/test"

module TestBrowser
  class TestSummary

    def self.build_summary(results)
      tests = results.fetch("tests", []).map do |test_data|
        TestBrowser::Test.new({
          name: test_data.fetch("name"),
          result: test_data.fetch("result")
        })
      end
      return TestBrowser::TestSummary.new({
        tests: tests
      })
    end

    attr_reader :tests

    def initialize(tests:)
      self.tests = tests
    end

    def failing_tests
      tests.select(&:failed?)
    end

    def passing_test_count
      tests.select(&:passed?).count
    end

    def test_names
      return tests.map(&:name)
    end

    private

    attr_writer :tests

  end
end
