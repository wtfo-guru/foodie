# frozen_string_literal: true

require_relative 'lib/foodie/version'

Gem::Specification.new do |spec|
  spec.name          = 'foodie'
  spec.version       = Foodie::VERSION
  spec.authors       = ['Quien Sabe']
  spec.email         = ['qs5779@mail.com']

  spec.summary       = 'Bundler howto develop a gem.'
  spec.description   = 'Using the foodie exampl. Great job.'
  spec.homepage      = 'https://bundler.io/v1.12/guides/creating_gem.html'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # NOTE: gib.rubygems.net is likey not a valid address
  #       I didn't want to expose my real private gem server in this public
  #       repsoitory so I masked it using /etc/hosts on my dev box
  #       in this fashion I can share this example and also test/verify my
  #       private geminabox container/server
  spec.metadata['allowed_push_host'] = 'http://gib.rubygems.net:9292'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'bundler-geminabox'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'

  spec.add_dependency 'activesupport'
  spec.add_dependency 'thor'
end
