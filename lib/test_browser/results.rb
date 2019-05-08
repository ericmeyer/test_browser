module TestBrowser
  class Results

    def self.get
      @_results || {
        "tests" => []
      }
    end

    def self.set(value)
      @_results = value
    end

  end
end
