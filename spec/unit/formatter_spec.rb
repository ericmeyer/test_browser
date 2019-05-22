require "test_browser/formatter"

describe TestBrowser::Formatter do

  before(:each) do
    @nbsp = TestBrowser::Formatter::NBSP
  end

  describe "Formatting a failure detail" do
    it "return the detail unchanged when there is no leading whitespace" do
      formatted_detail = TestBrowser::Formatter.format_failure_detail("a")
      expect(formatted_detail).to eq("a")
    end

    it "converts a single leading space to a nbsp" do
      formatted_detail = TestBrowser::Formatter.format_failure_detail(" a")
      expect(formatted_detail).to eq("#{@nbsp}a")
    end

    it "converts multiple leading spaces to nbsp" do
      formatted_detail = TestBrowser::Formatter.format_failure_detail("  a")
      expect(formatted_detail).to eq("#{@nbsp}#{@nbsp}a")
    end

    it "leaves other spaces unchanges" do
      formatted_detail = TestBrowser::Formatter.format_failure_detail(" A B")
      expect(formatted_detail).to eq("#{@nbsp}A B")
    end

    it "returns the given detail for all spaces" do
      formatted_detail = TestBrowser::Formatter.format_failure_detail(" ")
      expect(formatted_detail).to eq(" ")
    end
  end

end
