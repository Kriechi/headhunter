require 'html_validation'

module Headhunter
  class HtmlValidator
    attr_reader :responses

    def initialize
      @responses = []
    end

    def validate(url, html)
      @responses << PageValidations::HTMLValidation.new.validation(html, random_name)
    end

    def valid_responses
      @responses.select(&:valid?)
    end

    def invalid_responses
      @responses.reject(&:valid?)
    end

    def statistics
      lines = []

      lines << "Validated #{responses.size} pages.".yellow
      lines << "All pages are valid.".green if invalid_responses.size == 0
      lines << "#{x_pages_be(invalid_responses.size)} invalid.".red if invalid_responses.size > 0

      invalid_responses.each do |response|
        lines << "  #{response.resource}:".red
      
        ([response.exceptions].flatten).each do |exception|
          lines << "    - #{exception.strip}".red
        end
      end

      lines.join("\n")
    end

    private

    def x_pages_be(size)
      if size <= 1
        "#{size} page is"
      else
        "#{size} pages are"
      end
    end

    def random_name
      (0...8).map { (65 + rand(26)).chr }.join
    end
  end
end
