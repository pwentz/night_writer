require_relative 'content_parser'
require_relative "braille_parser"
require 'pry'

    contents = File.read(ARGV[0])

    content_parser = ContentParser.new(contents)
    parsed_contents = content_parser.parse_file.map{|line| line.flatten}
    # binding.pry
    File.write(ARGV[1], parsed_contents)
