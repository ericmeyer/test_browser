require "sinatra"
require "test_browser/results"
require "test_browser/test_summary"

post "/receive_results" do
  TestBrowser::Results.set(JSON.parse(request.body.read))
end

get "/" do
  test_summary = TestBrowser::TestSummary.build_summary(TestBrowser::Results.get)
  erb :index, { locals: { test_summary: test_summary} }
end
