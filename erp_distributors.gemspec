$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erp/distributors/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erp_distributors"
  s.version     = Erp::Distributors::VERSION
  s.authors     = ["Hung Nguyen", 
                    "Hien Nguyen", 
                    "Tu Hoang"]
  s.email       = ["nguyenvinhhientv1590@gmail.com",
                    "mrhungton@gmail.com",
                    "hoangtukg295@gmail.com"]
  s.homepage    = "http://globalnaturesoft.com/"
  s.summary     = "Distrubutors features of website E-commerce."
  s.description = "Distrubutors features of website E-commerce."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "erp_core"
  s.add_dependency "deface"
  
end