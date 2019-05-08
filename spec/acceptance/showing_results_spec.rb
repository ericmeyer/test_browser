require "sinatra_spec_helper"

describe "Displaying test result" do

  it "successfully gets the index before receiving any results" do
    get "/"

    expect(last_response).to be_ok
  end

  it "displays the received results for one passing test" do
    post_json "/receive_results", {
      tests: [{
        name: "MyTest1"
      }]
    }

    expect(last_response).to be_ok

    get "/"

    expect(last_response).to be_ok
    expect(last_response.body).to include("MyTest1")
  end

end
