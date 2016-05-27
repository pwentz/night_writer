require 'pry'
class BrailleParser
  attr_reader :parsed_braille
  def parse(braille)
    binding.pry
    if braille.length < 12
      @parsed_braille = braille.chars.each_slice(2).map(&:join)
    else
      # multi_char_parse
    end

    letter_isolation = braille.chars.each_slice(6).map(&:join)
    @parsed_braille = letter_isolation.map do |letter|
    letter.chars.each_slice(2).map(&:join)
    end
  end
end
