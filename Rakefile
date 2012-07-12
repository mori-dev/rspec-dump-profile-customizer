require 'rubygems' unless defined? Gem
require "rake"
require "rake/clean"
require "pathname"

task :default do
  sh "rake -T"
end

CLEAN.include "rspec-dump-profile-customizer-*.gem"


namespace :gem do

  desc "build rspec-dump-profile-customizer gem"
  task :build do
    sh "rake clean && gem build rspec-dump-profile-customizer.gemspec"
  end

  desc "run gem install on the built gem"
  task :install => :build do
    sh "gem install rspec-dump-profile-customizer*.gem"
  end

  desc "push rspec-dump-profile-customizer.gem to RubyGems"
  task :release do
    if Pathname.new("~/.gem/credentials").expand_path.exist?
      sh "gem push rspec-dump-profile-customizer*.gem"
    else
      raise "Your rubygems.org credentials aren't set. Run `gem push` to set them."
    end
  end
end
