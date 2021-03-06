require 'nokogiri'

class FormtyTwo

  def self.generate(form_id, template_language='slim', framework_language='foundation', form_dir='forms')

    require 'open-uri'

    google_form = ['https://docs.google.com/forms/d/', '/viewform']

    if !form_id || form_id == ''
      return false
    end

    form_url = google_form[0] + form_id + google_form[1]

    @form = Nokogiri::HTML(open(form_url))

    if @form.at_css('form').attr("id") == 'gaia_loginform'
      return 'Your form is password protected!'
    end

    crawler = Crawler.new(@form);
    builder = Builder.new(form_id, crawler.get_formdata, template_language, framework_language, form_dir);

    builder.formerate

    return 'Complete'

  end
end

require 'formty-two/crawler'
require 'formty-two/builder'
