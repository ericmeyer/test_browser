require "sinatra_spec_helper"

describe "Displaying test result" do

  it "successfully gets the index before receiving any results" do
    get "/"

    expect(last_response).to be_ok
  end

  it "displays the received results for a test suite" do
    post_json "/receive_results", {
      tests: [{
        name: "MyTest1",
        result: "passed"
      }, {
        details: [
          "Detail1",
          "Detail2"
        ],
        name: "MyTest2",
        result: "failed"
      }]
    }

    expect(last_response).to be_ok

    get "/"

    expect(last_response).to be_ok
    expect(last_response.body).not_to include("MyTest1")
    expect(last_response.body).to include("MyTest2")
    expect(last_response.body).to include("Detail1")
    expect(last_response.body).to include("Detail2")
  end

end
