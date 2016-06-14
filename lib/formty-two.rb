require 'nokogiri'

class FormtyTwo
  def self.generate(form_id)

    require 'open-uri'

    google_form = ['https://docs.google.com/forms/d/', '/viewform']

    if !form_id
      return false
    end

    form_url = google_form[0] + form_id + google_form[1]

    @form = Nokogiri::HTML(open(form_url))

    crawler = Crawler.new(@form);
    builder = Builder.new(crawler.get_formdata);

    puts builder.formerate

    return true

  end
end

require 'formty-two/crawler'
require 'formty-two/builder'
