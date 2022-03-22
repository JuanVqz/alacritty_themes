# frozen_string_literal: true

require_relative "lib/alacritty_themes/version"

Gem::Specification.new do |spec|
  spec.name          = "alacritty_themes"
  spec.version       = AlacrittyThemes::VERSION
  spec.authors       = ["Juan Vasquez"]
  spec.email         = ["me@juanvasquez.dev"]

  spec.summary       = "A collection of themes for alacritty"
  spec.description   = <<~DESC
    Your favorite collection of themes for alacritty,
    we initialize with a few themes and you can add more.
  DESC
  spec.homepage      = "https://github.com/juanvqz/alacritty_themes"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.5")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.metadata      = { "rubygems_mfa_required" => "true" }

  spec.add_development_dependency "pry", "~> 0.13.1"
end
