require 'fileutils'
require 'erb'

class FormtyTwo::Builder
  attr_reader :html

  def initialize(form_id, questions, template_language, framework_language, form_dir)
    @form_id = form_id
    @questions = questions
    @template_language = template_language
    @templates_folder = File.dirname(__FILE__) + "/templates/" + template_language + '-' + framework_language
    @form_dir = form_dir
    @html = ''
  end

  def formerate

    unless File.exists?(@form_dir)
      FileUtils::mkdir_p @form_dir
    end

    template_file = File.new("#{ @form_dir }/#{ @form_id }.#{ @template_language }", 'w')
    @questions.each do |key, question|
      case question[:type]
      when 'radio'
        @html << create_radio(key, question)
      when 'checkbox'
        @html << create_checkboxes(key, question)
      when 'text'
        @html << create_textinput(key, question)
      end
    end
    template_file.puts(@html)
    template_file.close
    return true
  end

  def create_textinput(name, question)
    @name = name
    @question = question

    source = "#{ @templates_folder }/text-input.erb"
    html = ERB.new(File.read(source)).result(binding)
    return html
  end

  def create_checkboxes(name, question)
    @name = name
    @question = question

    source = "#{ @templates_folder }/checkbox-input.erb"
    html = ERB.new(File.read(source)).result(binding)
    return html
  end

  def create_radio(name, question)
    @name = name
    @question = question

    source = "#{ @templates_folder }/radio-input.erb"
    html = ERB.new(File.read(source)).result(binding)
    return html
  end

end
