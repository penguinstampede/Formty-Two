require 'rake/testtask'

import 'lib/tasks/formty.rake'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test
