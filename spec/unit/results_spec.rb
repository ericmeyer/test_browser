require "test_browser/results"

describe TestBrowser::Results do

  before(:each) do
    TestBrowser::Results.set(nil)
  end

  describe "Getting the results" do
    it "defaults to an empty set of results" do
      expect(TestBrowser::Results.get).to eq({
        "tests" => []
      })
    end
  end

end
