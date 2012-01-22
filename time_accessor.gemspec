$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "time_accessor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "time_accessor"
  s.version     = TimeAccessor::VERSION
  s.authors     = ["Gabriel Odess-Gillett"]
  s.email       = ["gabeodess@gmail.com"]
  s.homepage    = "https://github.com/gabeodess/Time-Accessor"
  s.summary     = "Adds a time_accessor method to ActiveRecord::Base to create time attributes that acceput multiparameter inputs."
  s.description = "For a while now I have wanted to be able to have a time attribute accessor that was not backed by the database and would accept multiparameter arguments (in order to work seamlessly with rails form helpers).  Being unable to find a solution that satisfied me, I rolled my own."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"

  s.add_development_dependency "sqlite3"
end
