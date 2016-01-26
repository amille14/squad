$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "squad_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "squad_api"
  s.version     = SquadApi::VERSION
  s.authors     = ["Alex Miller"]
  s.email       = ["alex.burr.miller@gmail.com"]
  # s.homepage    = "TODO"
  s.summary     = "The internal API for squad."
  s.description = ""
  s.license     = "SquadInternal"

  s.files = Dir["{app,config,db,lib}/**/*"]

  s.add_dependency "rails", ">= 5.0.0.beta1", "< 5.1"
end
