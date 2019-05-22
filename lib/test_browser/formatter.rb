module TestBrowser
  module Formatter

    NBSP = "&nbsp;"

    def self.format_failure_detail(failure_detail)
      match = failure_detail.match(/^( +)(.+)/)
      if match
        leading_spaces = match[1].gsub(" ", NBSP)
        return "#{leading_spaces}#{match[2]}"
      else
        return failure_detail
      end
    end

  end
end
