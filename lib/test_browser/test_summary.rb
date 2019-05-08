require "test_browser/test"

module TestBrowser
  class TestSummary

    def self.build_summary(results)
      tests = results.fetch("tests", []).map do |test_data|
        TestBrowser::Test.new({
          name: test_data["name"]
        })
      end
      return TestBrowser::TestSummary.new({
        tests: tests
      })
    end

    def initialize(tests:)
      @tests = tests
    end

    def test_names
      return @tests.map(&:name)
    end

    private

  end
end
