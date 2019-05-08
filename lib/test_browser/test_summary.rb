module TestBrowser
  class TestSummary

    def self.build_summary(results)
      return TestBrowser::TestSummary.new(results)
    end

    def initialize(results)
      @results = results
    end

    def test_names
      return tests.map do |test|
        test["name"]
      end
    end

    private

    def tests
      @results.fetch("tests", [])
    end

  end
end
