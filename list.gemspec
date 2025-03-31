# frozen_string_literal: true

require_relative "lib/list/version"

Gem::Specification.new do |spec|
  spec.name = "list"
  spec.version = List::VERSION
  spec.authors = ["Jouk"]
  spec.email = ["jmartinezdiz@outlook.com"]

  spec.summary = "This is a example of List class."
  spec.description = "This is a example of List class"
  spec.homepage = "https://github.com/jmartinezdiz/list-gem"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'awesome_print', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'minitest', '~> 5.16'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
