class FormtyTwo::Builder
  def initialize(questions)
    @questions = questions
    @html = ''
  end

  def formerate
    slim_form = File.new("test.slim", 'w')
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
    slim_form.puts(@html)
    slim_form.close
    return true
  end

  def create_textinput(name, question)
    html = '.row' + "\r\n"
    html << "\t" + 'small-12.columns' + "\r\n"
    html << "\t\t" + "label #{ question[:label] }" + "\r\n"
    html << "\t\t\t" + "input type=\"text\" name=\"#{ name }\"" + "\r\n"

    return html
  end

  def create_checkboxes(name, question)
    html = '.row' + "\r\n"
    html << "\t" + 'fieldset.small-12.columns' + "\r\n"
    html << "\t\t" + "legend #{ question[:label] }" + "\r\n"

    question[:answers].each_with_index do |answer, index|
      input_id = "#{ name }_#{ index }"
      html << "\t\t" + "input##{ input_id } type=\"checkbox\" name=\"#{ name }[]\" value=\"#{ answer }\"" + "\r\n"
      html << "\t\t" + "label for=\"#{ input_id }\" #{ answer }" + "\r\n"
    end

    return html
  end

  def create_radio(name, question)
    html = '.row' + "\r\n"
    html << "\t" + 'fieldset.small-12.columns' + "\r\n"
    html << "\t\t" + "legend #{ question[:label] }" + "\r\n"

    question[:answers].each_with_index do |answer, index|
      input_id = "#{ name }_#{ index }"
      html << "\t\t" + "input##{ input_id } type=\"radio\" name=\"#{ name }\" value=\"#{ answer }\"" + "\r\n"
      html << "\t\t" + "label for=\"#{ input_id }\" #{ answer }" + "\r\n"
    end

    return html
  end

end
