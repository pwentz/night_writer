require_relative "braille_parser"
require 'pry'

class DecryptionFormatter
  attr_reader :formatted_braille
  def initialize(raw_braille)
    @raw_braille = raw_braille
    @braille_parser = BrailleParser.new
  end

  def parse_lines
    if @raw_braille.chars.find_all{|char|char=="\n"}.count > 3
      # unwrap_text
    else
      # if @raw_braille.class==string
        @formatted_braille = @raw_braille.split("\n")
      # else
      #   unwrap_text
      # end
    end
    parse_letters
  end

  def unwrap_text
    @formatted_braille = @raw_braille.map{|line|line.pop}
    binding.pry
  end

  def parse_letters
    @formatted_braille = @formatted_braille.map{|line| @braille_parser.parse(line)}
    parse_content
  end

  def parse_content
    @formatted_braille = @formatted_braille.map{|nest| nest.flatten}
    format_content
  end

  def format_content
    @formatted_braille = @formatted_braille.transpose.map {|nest| nest.reduce(:+)}
    final_assembly
  end

  def final_assembly
    @formatted_braille = @formatted_braille.reduce([]) do |adj_braille,code|
      adj_braille << code.chars.each_slice(2).map(&:join)
    end
  end

end
