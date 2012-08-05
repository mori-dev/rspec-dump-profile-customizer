$:.push File.expand_path("../lib", __FILE__)
require "rspec-dump-profile-customizer"
require "rspec-dump-profile-customizer/version"

Gem::Specification.new do |s|
  s.name        = "rspec-dump-profile-customizer"
  s.version     = RSpecDumpProfileCustomizer::VERSION
  s.authors     = ["mori-dev"]
  s.email       = ["mori.dev.asdf@gmail.com"]
  s.homepage    = "https://github.com/mori-dev/rspec-dump-profile-customizer"
  s.summary     = %q{RSpecDumpProfileCustomizer - a small rspec extension for detecting slow test in rails application}
  s.description = <<-EOS
    RSpecDumpProfileCustomizer provide report about worst N slow test and/or slow test over M seconds.
    You can set "N" and "M" in rails configuration file, application.rb.
  EOS

  s.files         = `git ls-files`.split("\n")

  s.require_paths = ["lib"]
  s.add_dependency "railties", ">= 3.0.0"
  s.add_dependency "rspec", ">= 2.0.0"
end
