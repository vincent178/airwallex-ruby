# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'airwallex-ruby'
  spec.version       = '0.0.1'
  spec.authors       = ['']
  spec.summary       = 'An unofficial Airwallex Ruby Client'
  spec.description   = 'An unofficial Airwallex Ruby Client'
  spec.homepage      = 'https://github.com/vincent178/airwallex-ruby'
  spec.license       = 'MIT'
  spec.metadata      = { } # use "yard" to build full HTML docs

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match?(%r{^(spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0.0'
  spec.extra_rdoc_files = ['README.md']
  spec.rdoc_options = ['--line-numbers', '--inline-source', '--title', 'airwallex-ruby', '--main', 'README.md']

  spec.add_dependency('faraday', '>= 0.9', '< 3.0')

  spec.add_development_dependency 'bundler', '>= 1.5', '< 3.0'
  spec.add_development_dependency 'logger', '~> 1.4.2'
end
