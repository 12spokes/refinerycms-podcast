#!/usr/bin/env ruby
require File.expand_path('../podcast.rb', __FILE__)
version = Refinery::Podcast.version
raise "Could not get version so gemspec can not be built" if version.nil?
files = %w( readme.md license.md  )
%w(app config generators lib public rails test vendor).each do |dir|
  files += Dir.glob("#{dir}/**/*") if File.directory?(dir)
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-podcast}
  s.version           = %q{#{version}}
  s.description       = %q{Plugin for Refinery CMS to manage and publish podcasts to iTunes}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Ruby on Rails podcast plugin for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\\ Digital)
  s.require_paths     = %w(lib)

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  #{"s.test_files        = [
    '#{Dir.glob("test/**/*.rb").join("',\n    '")}'
  ]" if File.directory?("test")}
end
EOF

File.open(File.expand_path("../../refinerycms-podcast.gemspec", __FILE__), 'w').puts(gemspec)