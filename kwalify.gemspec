#!/usr/bin/ruby

###
### $Rev: 94 $
### $Release: 0.7.1 $
### copyright(c) 2005-2008 kuwata-lab all rights reserved.
###

require 'rubygems'

spec = Gem::Specification.new do |s|
   ## package information
   s.name        = "kwalify"
   s.author      = "makoto kuwata"
   s.version     = "0.7.1"
   s.platform    = Gem::Platform::RUBY
   s.homepage    = "http://www.kuwata-lab.com/kwalify/"
   s.summary     = "a parser, schema validator, and data-binding tool for YAML and JSON."
   s.description = <<-'END'
   Kwalify is a parser, schema validator, and data binding tool for YAML and JSON.
   END
   
   ## files
   files = []
   files.concat Dir.glob('lib/**/*')
   files.concat Dir.glob('bin/**/*')
   files.concat Dir.glob('examples/**/*')
   files.concat Dir.glob('test/**/*')
   files.concat Dir.glob('man/**/*')
   files.concat Dir.glob('contrib/**/*')
   files.concat Dir.glob('doc-api/**/*')
   files.concat [ "doc/users-guide.html", "doc/docstyle.css", "doc/img/fig01.png" ]
   files.concat %w[README.txt CHANGES.txt MIT-LICENSE setup.rb ]  # todo.txt
   #s.files       = files.delete_if { |path| path =~ /\.svn/ }
   s.files       = files
   s.executables = ["kwalify"]
   s.bindir      = "bin"
   s.test_file   = 'test/test.rb'
end

# Quick fix for Ruby 1.8.3 / YAML bug   (thanks to Ross Bamford)
if (RUBY_VERSION == '1.8.3')
  def spec.to_yaml
    out = super
    out = '--- ' + out unless out =~ /^---/
    out
  end
end

if $0 == __FILE__
  Gem::manage_gems
  Gem::Builder.new(spec).build
end
