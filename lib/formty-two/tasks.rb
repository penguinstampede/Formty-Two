require 'rake'
require 'rake/dsl_definition'
require 'formty-two'

namespace :formty do

  desc "Generate template file from Google Form ID. Only the Form ID is required."
  task :build_form, :form_id, :template_language, :framework_language, :form_dir  do |t, args|
    FormtyTwo::generate(args[:form_id,:template_language,:framework_language,:form_dir])
  end

end
