$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "event_notifier/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "event_notifier"
  s.version     = EventNotifier::VERSION
  s.authors     = ["Shahzad Tariq"]
  s.email       = ["m.shahzad.tariq@hotmail.com"]
  s.homepage    = "http://github.com/mshahzadtariq/event_notifier"
  s.summary     = "Listen for database events like create new record, updated existing or destroy & notify."
  s.description = "Listen for database events like create new record, updated existing or destroy & notify. These events can be used with ActionController::Live or Server Sent Events (SSE)"
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.add_dependency "rails", '>= 4.1'
end