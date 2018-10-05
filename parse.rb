require "minruby"
pp minruby_parse(File.read(ARGV[0]))
