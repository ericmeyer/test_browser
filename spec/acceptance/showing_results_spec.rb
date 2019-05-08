require "acceptance/spec_helper"

describe "Displaying test result" do
  it "successfully gets the index before receiving any results" do
    get "/"

    expect(last_response).to be_ok
  end
end
