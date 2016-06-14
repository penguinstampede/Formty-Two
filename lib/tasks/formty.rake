require 'formty-two'

namespace :formty do

  desc "Generate slim file from Google Form ID"
  task :build_slim, :form_id do |t, args|
    FormtyTwo::generate(args[:form_id])
  end

end
