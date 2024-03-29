$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "log_pile/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "log_pile"
  s.version     = LogPile::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of LogPile."
  s.description = "TODO: Description of LogPile."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.10"
  s.add_dependency "file-tail"
  s.add_dependency "rake", "~> 0.8.7"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
