module TestBrowser
  class Test

    attr_reader :name

    def initialize(name:, result:)
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
    attr_writer :name

  end
end
