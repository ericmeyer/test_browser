$: << File.expand_path(File.join(File.dirname(__FILE__), "lib"))

require "sinatra"
require "test_browser/results"
require "test_browser/test_summary"

post "/receive_results" do
  body = request.body.read
  TestBrowser::Results.set(JSON.parse(body))
  "Success"
end

get "/" do
  test_summary = TestBrowser::TestSummary.build_summary(TestBrowser::Results.get)
  erb :index, { locals: { test_summary: test_summary} }
end
