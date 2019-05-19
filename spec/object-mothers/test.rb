require "test_browser/test"

class TestMother

  def self.failing_test_with_details(test_name, details)
    return TestBrowser::Test.new({
      details: details,
      name: test_name,
      result: "failed"
    })
  end

  def self.failing_test(test_name)
    return TestBrowser::Test.new({
      name: test_name,
      result: "failed"
    })
  end

  def self.passing_test(test_name)
    return TestBrowser::Test.new({
      name: test_name,
      result: "passed"
    })
  end

  def self.skipped_test(test_name)
    return TestBrowser::Test.new({
      name: test_name,
      result: "skipped"
    })
  end

end
