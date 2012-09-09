require File.expand_path('../config/boot.rb', __FILE__)
require 'padrino-core/cli/rake'
PadrinoTasks.init

require 'bundler/setup'
require 'rake'
require 'rake/clean'
require 'uri'

import 'spec/spec.rake'
import "features/cucumber.rake"

task :default do
end

begin
  desc "Run continuous integration tests"
  task :ci do
  end
  
  task :ci => [:spec, :features]
rescue LoadError
  puts "Can\'t run test suites, are you in a production environment?"
end
