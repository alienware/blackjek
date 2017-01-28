# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blackjek/version'

Gem::Specification.new do |spec|
  spec.name          = "blackjek"
  spec.version       = Blackjek::VERSION
  spec.authors       = ["alienware"]
  spec.email         = ["tanayupadhyaya@gmail.com"]

  spec.summary       = %q{Blackjack is a popular card game played against a Dealer. In this card game, the Player is trying to beat the Dealer.}
  spec.description   = %q{Blackjack is a popular card game played against a Dealer. In this card game, the Player is trying to beat the Dealer.}
  spec.homepage      = "https://github.com/alienware/blackjek"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
end
