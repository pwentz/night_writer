require_relative "braille_parser"
require 'pry'

class DecryptionFormatter
  attr_reader :raw_braille, :parsed_content, :sorted_braille
  def initialize
    @sorted_braille = Array.new
  end

  def parse_braille(raw_braille)
    braille_parser = BrailleParser.new
    parsed_lines = raw_braille.split("\n")
    parsed_letters = parsed_lines.map{|line| braille_parser.parse(line)}
    @parsed_content = parsed_letters.map{|nest| nest.flatten}
  end

  def format_content
    until @parsed_content.all?{|nests|nests.empty?}
    @sorted_braille.push(@parsed_content.map {|line| line[0+0+0]})
    @parsed_content.each {|letter| letter.shift}
    end
    @sorted_braille
  end


end
