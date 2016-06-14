Gem::Specification.new do |s|
  s.name        = 'formty-two'
  s.version     = '0.0.1'
  s.date        = '2016-06-05'
  s.summary     = "Google Form Pretty HTML Generator"
  s.description = "Give it a Google Form ID, and it will generate nice HTML forms for your templates.  Use AJAX in your templates to post the answers."
  s.authors     = ["Erin Kosewic"]
  s.email       = 'erin@penguinstampede.com'
  s.files       = ["lib/formty-two.rb", "lib/formty-two/crawler.rb", "lib/formty-two/builder.rb", "lib/tasks/formty.rake"]
  s.license     = 'MIT'

  s.add_dependency 'nokogiri'
end
