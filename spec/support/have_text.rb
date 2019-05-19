RSpec::Matchers.define :have_text do |expected_text|
  match do |element|
    element.text == expected_text
  end
  failure_message do |element|
    if element.length != 1
      "`have_text` can only be used for a single element. #{element.size} found."
    else
      "expected text: #{expected_text}\n  actual text: #{element.text}"
    end
  end

  failure_message_when_negated do |element|
    if element.length != 1
      "`have_text` can only be used for a single element. #{element.size} found."
    else
      "expected text: value != #{expected_text}\n  actual text: #{element.text}"
    end
  end
end
