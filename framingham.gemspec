lib = File.expand_path('./framingham')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$LOAD_PATH << lib

require 'version'

Gem::Specification.new{ |_|
  _.name          = "framingham"
  _.version       = Framingham::VERSION
  _.author        = "3PoundHealth"
  _.summary       = "Gem to implement Framingham Heart Study calculators"
  _.license       = "MIT"
  _.files         = `git ls-files`.split($/)
  _.executables   = _.files.grep(%r{^/}) { |f| File.basename(f) }
  _.test_files    = _.files.grep(%r{^(test|spec|features)/})
  _.require_path  = "."
  _.add_development_dependency "bundler", "~> 1.3"
  _.add_development_dependency "rake"
}
