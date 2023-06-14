require_relative 'lib/hashed_ids/version'

Gem::Specification.new do |spec|
  spec.name        = 'hashed_ids'
  spec.version     = HashedIds::VERSION
  spec.authors     = ['Luis Fernando Rivera']
  spec.email       = ['ferchoriverar@gmail.com']
  spec.homepage    = 'https://github.com/FerchoRiveraR/hashed_ids'
  spec.summary     = 'Hashed IDs for your Ruby on Rails models'
  spec.description = 'Hashed IDs for your Ruby on Rails models'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/FerchoRiveraR/hashed_ids'
  spec.metadata['changelog_uri'] = 'https://github.com/FerchoRiveraR/hashed_ids'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'hashids', '>= 1.0.0', '< 2.0.0'
  spec.add_dependency 'rails', '>= 7.0.5'
end
