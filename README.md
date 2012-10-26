# RSpec Dump Profile Customizer

RSpecDumpProfileCustomizer provides report about worst N slow test and/or slow test over N seconds. You can set "N" in rails configuration file, application.rb. This is a small gem which modify dump_profile method in rspec for rails application. It therefore depends on rspec and rails.

## Installation

Add 'rspec-dump-profile-customizer' gem to your existing app’s Gemfile:

    gem 'rspec-dump-profile-customizer'

Bundle it:

    % bundle

## Usage

Set up rspec-dump-profile-customizer is easy. Just put it in your Gemfile and add your application.rb settings.

config/environments/test.rb

    config.rspec_dump_profile.number  = 15
    config.rspec_dump_profile.second  = 3.5

Then, run your specs like this from now on:

    $ bundle exec rspec -p spec/*/*_spec.rb

If you want to see slow tests as your default formatter, simply put the options in your .rspec file:

    --profile

Then, run your specs like this from now on:

    $ bundle exec rake spec



![Sample Image](https://github.com/mori-dev/rspec-dump-profile-customizer/raw/master/doc/img/rspec-dump-profile-customizer-sample.png)


## Prerequisites

    A Rails >= 3.0 Application with RSpec >= 2.0

## Contributing

Send me your pull requests.

## Copyright

Copyright (c) mori-dev. See LICENSE for details.
