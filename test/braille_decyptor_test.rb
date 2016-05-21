gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/braille_decryptor'
require_relative '../lib/braille_parser'
require 'pry'

class BrailleDecryptorTest < Minitest::Test
  def test_decrypt_a_character
    decryptor = BrailleDecryptor.new
    parser1 = BrailleParser.new
    braille1 = "00.00."
    braille2 = "00..00"
    braille3 = "00000."
    braille4 = ".0000."
    braille5 = "..000."
    braille6 = "....00"
    # binding.pry
    assert_equal "n", decryptor.decrypt(parser1.parse(braille1))
    assert_equal "x", decryptor.decrypt(parser1.parse(braille2))
    assert_equal "q", decryptor.decrypt(parser1.parse(braille3))
    assert_equal "t", decryptor.decrypt(parser1.parse(braille4))
    assert_equal "!", decryptor.decrypt(parser1.parse(braille5))
    assert_equal "-", decryptor.decrypt(parser1.parse(braille6))
  end

  def test_decrypt_multiple_letters
    parser1 = BrailleParser.new
    decryptor = BrailleDecryptor.new
    assert_equal "ab", decryptor.decrypt(parser1.parse("0.....0.0..."))
    assert_equal "bfg", decryptor.decrypt(parser1.parse("0.0...000...0000.."))
    assert_equal "cats", decryptor.decrypt(parser1.parse("00....0......0000..00.0."))
    assert_equal "hammer", decryptor.decrypt(parser1.parse("0.00..0.....00..0.00..0.0..0..0.000."))
  end
end
