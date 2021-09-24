$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'openstax/path_prefixer/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'openstax_path_prefixer'
  s.version     = OpenStax::PathPrefixer::VERSION
  s.authors     = ['Karina Mendez', 'Dante Soares', 'JP Slavinsky']
  s.email       = ['jps@rice.edu']
  s.homepage    = 'https://github.com/openstax/path_prefixer'
  s.summary     = 'Removes a path prefix from incoming requests, if present'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 3.0'
  s.add_dependency 'addressable'

  s.add_development_dependency 'rspec-rails'
end
