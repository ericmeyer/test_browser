require "sinatra"

class Results

  def self.get
    JSON.parse(File.read("results.json"))
  end

end

get "/" do
  erb :index, {locals: {results: Results.get}}
end
