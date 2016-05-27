gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
# require_relative '../lib/braille_decryptor'
require_relative '../lib/braille_parser'
require 'pry'

class BrailleParserTest < Minitest::Test
  def test_parser_turns_braille_length_string_into_arrays_of_strings
    skip
    parser = BrailleParser.new
    assert_instance_of Array, parser.parse("string")
    assert_instance_of String, parser.parse("string").first
  end

  def test_parser_returns_even_array_strings_braille_length
    skip
    parser = BrailleParser.new
    parsed_braille = parser.parse("string")
    assert_equal 6, parsed_braille.join.length
    assert_equal 3, parsed_braille.count
    assert_equal 2, parsed_braille[0].length
    assert_equal 2, parsed_braille[1].length
  end

  def test_parser_turns_two_braille_characters_into_nested_arrays
    skip
    parser = BrailleParser.new
    pair_of_braille = "00..00..00.."

    parsed_braille = parser.parse(pair_of_braille)

    assert_equal 12, pair_of_braille.length
    assert_instance_of Array, parsed_braille.first
    assert_equal 2, parsed_braille.count
    assert parsed_braille.all?{|letter|letter.count==3}
    assert parsed_braille.first.all?{|code|code.length==2}
    assert parsed_braille[1].all?{|code|code.length==2}

  end

  def test_parser_can_nest_three_braille_chars_into_nested_arrays
    parser = BrailleParser.new
    three_braille_letters = "00..00..00..000000"

    parsed_braille = parser.parse(three_braille_letters)

    assert_equal 18, three_braille_letters.length
    assert_equal 3, parsed_braille.count
    assert parsed_braille.all?{|letter|letter.length==3}
    assert parsed_braille.first.all?{|code|code.length==2}
    assert parsed_braille[1].all?{|code|code.length==2}
  end
end
