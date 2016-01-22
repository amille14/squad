$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "api"
  s.version     = Api::VERSION
  s.authors     = ["Alex Miller"]
  s.email       = ["alex.burr.miller@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Api."
  s.description = "TODO: Description of Api."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.beta1", "< 5.1"

  s.add_development_dependency "sqlite3"
end
