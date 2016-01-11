# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'will_paginate/nobrainer/version'

Gem::Specification.new do |spec|
  spec.name = 'will_paginate-nobrainer'
  spec.version = WillPaginate::NoBrainer::VERSION::STRING
  spec.authors = ['Vasiliy Yorkin']
  spec.email= ['vasiliy.yorkin@gmail.com']

  spec.summary = "will_paginate-nobrainer-#{WillPaginate::NoBrainer::VERSION::STRING}"
  spec.description = 'NoBrainer adapter for will_paginate'
  spec.homepage = 'https://github.com/vyorkin-personal/will_paginate-nobrainer'

  spec.files = `git ls-files -- lib/*`.split("\n")
  spec.files += %w(README.md LICENSE.txt)
  spec.bindir = 'exe'
  spec.executables = `git ls-files -- exe/*`.split("\n").map { |file| File.basename(file) }

  spec.test_files = []
  spec.require_path = 'lib'
  spec.license = 'MIT'

  spec.add_runtime_dependency 'will_paginate', '~> 3.1'
  spec.add_runtime_dependency 'nobrainer', '~> 0.30'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'

  spec.add_development_dependency 'yard', '~> 0.8', '>= 0.8.7'
  spec.add_development_dependency 'yard-rspec', '~> 0.1'
  spec.add_development_dependency 'simplecov', '~> 0.10', '>= 0.10.0'
end
