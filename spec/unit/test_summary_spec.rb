require "test_browser/test_summary"

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
            "name" => "foobar"
          }]
        })

        expect(summary.test_names).to eq(["foobar"])
      end
    end
  end

end
