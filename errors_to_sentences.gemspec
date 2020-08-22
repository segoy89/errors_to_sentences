require_relative 'lib/errors_to_sentences/version'

Gem::Specification.new do |spec|
  spec.name          = "errors_to_sentences"
  spec.version       = ErrorsToSentences::VERSION
  spec.authors       = ["segoy89"]
  spec.email         = ["a.szamansky@gmail.com"]

  spec.summary       = %q{Simple gem to transform error messages into sentences}
  spec.description   = %q{Useful when attribute has multiple error messages. This gem allows to combine those messages into one sentence}
  spec.homepage      = "http://github.com/segoy89/errors_to_sentences"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/segoy89/errors_to_sentences"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", ">=4.0.2"
end
