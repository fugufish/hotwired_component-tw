require_relative "lib/hotwired_component/tw/version"

Gem::Specification.new do |spec|
  spec.name        = "hotwired_component-tw"
  spec.version     = HotwiredComponent::Tw::VERSION
  spec.authors     = ["fugufish"]
  spec.email       = ["therealfugu@gmail.com"]
  spec.homepage    = "https://github.com/fugufish/hotwired_component/tw"
  spec.summary     = "TailwindCSS helpers for HotwiredComponent"
  spec.description = "TailwindCSS helpers for HotwiredComponent"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.3", ">= 6.1.3.2"
  spec.add_dependency "hotwired_component", "~> 0.2"
end
