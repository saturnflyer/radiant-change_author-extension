# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-change_author-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-change_author-extension"
  s.version     = RadiantChangeAuthorExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantChangeAuthorExtension::AUTHORS
  s.email       = RadiantChangeAuthorExtension::EMAIL
  s.homepage    = RadiantChangeAuthorExtension::URL
  s.summary     = RadiantChangeAuthorExtension::SUMMARY
  s.description = RadiantChangeAuthorExtension::DESCRIPTION

  ignores = if File.exist?(".gitignore")
    File.read(".gitignore").split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir["**/*"] - ignores
  s.test_files    = Dir["test/**/*","spec/**/*","features/**/*"] - ignores
  s.require_paths = ["lib"]

  # s.add_dependency "some_gem", "~> 1.0.0"

  s.post_install_message = %{
  Add the Change Author Extension to your Radiant CMS project with:
    gem "radiant-change_author-extension", "~> #{RadiantChangeAuthorExtension::VERSION}"
  }
end