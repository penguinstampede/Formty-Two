require 'nokogiri'
require 'thor'

class FormtyTwo < Thor

  def self.generate(form_id, template_language='slim', framework_language='foundation')

    require 'open-uri'

    google_form = ['https://docs.google.com/forms/d/', '/viewform']

    if !form_id || form_id == ''
      return false
    end

    form_url = google_form[0] + form_id + google_form[1]

    @form = Nokogiri::HTML(open(form_url))

    crawler = Crawler.new(@form);
    builder = Builder.new(form_id, crawler.get_formdata, template_language, framework_language);

    builder.formerate

    return 'Complete'

  end
end

require 'formty-two/crawler'
require 'formty-two/builder'
