Gem::Specification.new do |s|
  s.name        = 'formty-two'
  s.version     = '0.0.2'
  s.date        = '2016-06-05'
  s.summary     = "Google Form Pretty HTML Generator"
  s.description = "Give it a Google Form ID, and it will generate nice HTML forms for your templates.  Use AJAX in your templates to post the answers."
  s.authors     = ["Erin Kosewic"]
  s.email       = 'erin@penguinstampede.com'
  s.files       = Dir["{lib}/**/*.rb","{lib}/**/*.erb"]
  s.require_path = 'lib'
  s.license     = 'MIT'

  s.add_dependency 'nokogiri', '~> 1.6.7.1'
end
