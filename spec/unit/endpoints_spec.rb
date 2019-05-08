require "sinatra_spec_helper"
require "test_browser/results"
require "test_browser/test_summary"

describe "Endpoints" do

  describe "Receiving results" do
    it "saves the results" do
      post_json "/receive_results", { "some" => "results" }

      expect(TestBrowser::Results.get).to eq({ "some" => "results" })
    end
  end

  describe "Showing results" do
    it "builds a test summary" do
      current_results = { "my" => "results" }
      TestBrowser::Results.set(current_results)
      test_summary = TestBrowser::TestSummary.build_summary(TestBrowser::Results.get)

      expect(TestBrowser::TestSummary).to receive(:build_summary).with(current_results).and_return(test_summary)

      get "/"
    end
  end

end
