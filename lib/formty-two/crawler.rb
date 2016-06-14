class FormtyTwo::Crawler
  def initialize(form)
    @form = form
    @questions = {}
  end

  def get_formdata
    form_inputs = @form.css "form input"

    form_inputs.each do |input|
      if input["name"].include? "entry"
        crawl(input)
      end
    end

    return @questions
  end

  def crawl(input)

    type = input_type(input.parent)

    label = get_label(input, type)

    if @questions[input["name"]].nil?
      @questions[input["name"]] = {
        :type => type,
        :label => label
      }
    end

    if type == 'radio'
      answers = []

      radio_choices = input.previous.css('.freebirdFormviewerViewItemsRadioChoice .freebirdFormviewerViewItemsRadioLabel')
      radio_choices.each do |label|
        answers.push(label.content)
      end

      @questions[input["name"]][:answers] = answers
    end

    if type == 'checkbox'

      if @questions[input["name"]][:answers].nil?
        @questions[input["name"]][:answers] = []
      end

      @questions[input["name"]][:answers].push(input.previous.at_css('.freebirdFormviewerViewItemsCheckboxLabel').content)
    end

  end

  def get_label(input, type)

    label = 'unknown'

    case type
    when 'radio'
      label_wrapper = input.parent.previous
      label = label_wrapper.at_css('.freebirdFormviewerViewItemsItemItemTitle').content
    when 'checkbox'
      label_wrapper = input.parent.parent.previous
      label = label_wrapper.at_css('.freebirdFormviewerViewItemsItemItemTitle').content
    when 'text'
      label = input.parent.at_css('.freebirdFormviewerViewItemsItemItemTitle').content
    end

    return label

  end

  def input_type(parent)

    the_class = parent.attr('class')
    the_type = 'radio'

    unless the_class.nil?
      if the_class.include? 'freebirdFormviewerViewItemsTextTextItem'
        the_type = 'text'
      elsif  the_class.include? 'freebirdFormviewerViewItemsCheckboxChoice'
        the_type = 'checkbox'
      else
        the_type = 'radio'
      end
    end

    return the_type

  end


end
