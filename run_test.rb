require 'minruby'
require 'colorize'
require 'pp'
require 'stringio'

MY_PROGRAM = 'interp.rb'

Dir.glob('test*.rb').sort.each do |f|
  next if f == "test4-4.rb"
  correct = `ruby #{f}`
  answer = `ruby #{MY_PROGRAM} #{f}`

  print "#{f} => "
  if correct == answer
    puts "OK!".green
  else
    puts "NG".red

    out = StringIO.new
    PP.pp(minruby_parse(File.read(f)), out)
    out.rewind
    puts out.read.yellow

    exit(1)
  end
end

Dir.glob('test*.rb').sort.each do |f|
  next if f == "test4-4.rb"
  correct = `ruby #{f}`
  answer = `ruby #{MY_PROGRAM} #{MY_PROGRAM} #{f}`

  print "#{f} => "
  if correct == answer
    puts "OK!".green
  else
    puts "NG".red

    out = StringIO.new
    PP.pp(minruby_parse(File.read(f)), out)
    out.rewind
    puts out.read.yellow

    exit(1)
  end
end
