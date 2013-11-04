spec = Gem::Specification.new do |s|
  s.name = 'simplelogger'
  s.version = "0.0.1"
  s.authors = ["vkhatri (Virender Khatri)"]
  s.date = '2013-11-04'
  s.platform = Gem::Platform::RUBY
  s.license  = 'MIT'
  s.email = 'vir.khatri@gmail.com'
  # s.rubyforge_project = 'simplelogger'
  s.summary = 'Ruby File/Console Message Logger'
  s.description = "Simple Ruby module to log messages to file \& console"
  # Add your other files here if you make them
  s.files = ["README.md","LICENSE","lib/simplelogger.rb"]
  s.homepage = 'https://github.com/vkhatri/simplelogger'
  s.add_dependency('term-ansicolor')
end
