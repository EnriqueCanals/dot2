#!/usr/bin/env ruby
require 'rubygems'
require 'json'

root = File.expand_path(ARGV[0] ? ARGV[0] : ".") + "/"
objectName = "JST"
templateDir = "app/js/templates/"
templates = Dir["#{root}#{templateDir}**/*.jst"]
contents = {}

templates.each do |path|
  fileContents = File.readlines(path).map(&:strip)
  key = path.sub!(/^#{root}#{templateDir}(.*)\.jst/, '\1').split("/").join("_")
  contents[key] = fileContents.join("\n")
end

File.open(root + templateDir + "templates.js", "w") do |f|
  f.write("var #{objectName} = " + JSON.dump(contents) + ";")
end
