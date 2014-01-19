# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = 'headhunter'
  s.version     = '0.0.2'
  s.authors     = ['Joshua Muheim']
  s.email       = 'josh@muheimwebdesign.ch'
  s.homepage    = 'http://github.com/jmuheim/headhunter'
  s.summary     = 'Zero config HTML & CSS validation tool for Rails apps'
  s.description = 'Headhunter is an HTML and CSS validation tool that injects itself into your Rails feature tests and automagically checks all your generated HTML and CSS for validity. In addition, it also looks out for unused (and therefore superfluous) CSS selectors.'
  s.license     = 'MIT'

  s.add_dependency 'nokogiri'
  s.add_dependency 'css_parser', '~> 1.2.6'
  s.add_dependency 'html_validation'
  s.add_dependency 'colorize'

  s.add_dependency('rspec')
  s.add_development_dependency('fuubar')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '>= 2.0')

  s.files = Dir.glob('lib/**/**')
end
