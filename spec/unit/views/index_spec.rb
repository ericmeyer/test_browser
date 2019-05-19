require "spec_helper"
require "object-mothers/test"
require "object-mothers/test_summary"
require "support/template"
require "nokogiri"
require "test_browser/test_summary"

describe "index.erb" do

  def render_index(test_summary)
    return Template.render("index.erb", {
      test_summary: test_summary
    })
  end

  describe "Rendering the view" do
    it "shows the total number of tests" do
      test_summary = TestSummaryMother.with_multiple_tests

      template = render_index(test_summary)

      element = template.find("[data-id='total-number-of-tests']")
      expect(element).to have_text(test_summary.tests.count.to_s)
    end

    it "shows the number of passing tests" do
      test_summary = TestSummaryMother.with_multiple_tests

      template = render_index(test_summary)

      element = template.find("[data-id='number-of-passing-tests']")
      expect(element).to have_text(test_summary.passing_test_count.to_s)
    end

    it "shows the number of failing tests" do
      test_summary = TestSummaryMother.with_multiple_tests

      template = render_index(test_summary)

      element = template.find("[data-id='number-of-failing-tests']")
      expect(element).to have_text(test_summary.failing_tests.count.to_s)
    end

    context "when there are failing tests" do
      it "shows the failure summary" do
        test_summary = TestSummaryMother.with_failing_tests

        template = render_index(test_summary)

        failure_summary = template.find("[data-id='failure-summary']")
        expect(failure_summary).not_to be_empty
      end

      it "shows the failing test" do
        failing_test = TestMother.failing_test_with_details("MyTest", [
          "detail1",
          "detail2"
        ])
        test_summary = TestSummaryMother.with_tests([ failing_test ])

        template = render_index(test_summary)

        failure_summary = template.find("[data-id='failure-summary']")
        expect(failure_summary.text).to include("MyTest")
        expect(failure_summary.text).to include("detail1")
        expect(failure_summary.text).to include("detail2")
      end
    end

    context "when there are no failing tests" do
      it "does not have a failure summary" do
        test_summary = TestSummaryMother.with_all_passing_tests

        template = render_index(test_summary)

        failure_summary = template.find("[data-id='failure-summary']")
        expect(failure_summary).to be_empty
      end
    end
  end

end
