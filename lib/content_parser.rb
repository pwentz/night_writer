# require_relative "night_writer"
require_relative "braille_parser"
require 'pry'

class ContentParser
  attr_reader :parse_file, :contents
  def initialize(contents)
    @contents = contents
  end

  def parse_file
    braille_parser = BrailleParser.new
    parsed_lines = @contents.split("\n")
    parsed_letters = parsed_lines.map{|line| braille_parser.parse(line)}
  end
end
