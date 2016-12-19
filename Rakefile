require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "item.rb"
  t.test_files = FileList['./*_test.rb', './tests/*_test.rb']
  t.verbose = true
end

task default: :test
