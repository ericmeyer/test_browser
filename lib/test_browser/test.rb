module TestBrowser
  class Test

    attr_reader :details, :name

    def initialize(name:, result:, details: [])
      self.details = details
      self.name = name
      self.result = result
    end

    def failed?
      result == "failed"
    end

    def passed?
      result == "passed"
    end

    private

    attr_accessor :result
    attr_writer :details, :name

  end
end
