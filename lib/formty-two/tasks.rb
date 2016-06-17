require 'rake'
require 'rake/dsl_definition'
require 'formty-two'

namespace :formty do

  desc "Generate template file from Google Form ID"
  task :build_form, [:form_id, :template_language, :framework_language, :form_dir]  do |t, args|
    args.with_defaults(:template_language => 'slim', :framework_language => 'foundation', :form_dir => 'forms')
    FormtyTwo::generate(args[:form_id], args[:template_language], args[:framework_language], args[:form_dir])
  end

end
