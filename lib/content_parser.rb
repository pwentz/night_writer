require_relative "braille_parser"
require 'pry'

class ContentParser
  attr_reader :contents, :parsed_content, :decrypted_braille
  def initialize(contents)
    @contents = contents
  end

  def parse_file
    braille_parser = BrailleParser.new
    parsed_lines = @contents.split("\n")
    parsed_letters = parsed_lines.map{|line| braille_parser.parse(line)}
    @parsed_content = parsed_letters.map{|nest| nest.flatten}
  end

  def format_content
    sorted_braille = Array.new
    decryptor = BrailleDecryptor.new
    until @parsed_content.all?{|nests|nests.empty?}
    sorted_braille.push(@parsed_content.map {|line| line[0+0+0]})
    @parsed_content.each {|letter| letter.shift}
    end
    @decrypted_braille = sorted_braille.map{|code|decryptor.decipher[code]}.join
  end
end
