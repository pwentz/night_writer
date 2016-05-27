gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/braille_decryptor'
require 'pry'

class BrailleDecryptorTest < Minitest::Test
  def test_decrypt_a_character
    skip
    decryptor = BrailleDecryptor.new
    braille1 = "00.00."
    braille2 = "00..00"
    braille3 = "00000."
    braille4 = ".0000."
    braille5 = "..000."
    braille6 = "....00"

    assert_equal "n", decryptor.decrypt(braille1)
    assert_equal "x", decryptor.decrypt(braille2)
    assert_equal "q", decryptor.decrypt(braille3)
    assert_equal "t", decryptor.decrypt(braille4)
    assert_equal "!", decryptor.decrypt(braille5)
    assert_equal "-", decryptor.decrypt(braille6)
  end

  def test_decrypt_multiple_letters
    skip
    decryptor = BrailleDecryptor.new

    assert_equal "ab", decryptor.decrypt("0.0.\n..0.\n....\n")
    assert_equal "bfg", decryptor.decrypt("0.0000\n0.0.00\n......\n")
    assert_equal "cats", decryptor.decrypt("000..0.0\n....000.\n....0.0.\n")
    assert_equal "hammer", decryptor.decrypt("0.0.00000.0.\n00.......000\n....0.0...0.\n")
  end

  def test_decrypt_can_adjust_to_caps
    skip
    decryptor = BrailleDecryptor.new
    raw_braille1 = "0..0...00.\n000...0..0\n0....00...\n"

    assert_equal "riSe", decryptor.decrypt(raw_braille1)
  end

  def test_decrypt_can_adjust_if_first_char_caps
    skip
    decryptor = BrailleDecryptor.new
    raw_braille1 = "..0.0.00000.0.\n..00.......000\n.0....0.0...0.\n"
    raw_braille2 = "..0..0...00.\n..000...0..0\n.00....00...\n"

    assert_equal "Hammer", decryptor.decrypt(raw_braille1)
    assert_equal "RiSe", decryptor.decrypt(raw_braille2)
  end

  def test_decrypt_can_adjust_to_caps_and_nums
    # skip
    decryptor = BrailleDecryptor.new
    raw_braille = ".00..00..0000....0\n00.0.0...0.0.0..00\n0.0.00..000.0..0.0\n"

    assert_equal "to1noW", decryptor.decrypt(raw_braille)
  end

  def test_decrypt_can_adjust_to_multiple_caps_and_nums
    skip
    decryptor = BrailleDecryptor.new
    raw_braille = "..000..000.00...00.000.00.\n.....0.00..0.0.....000.00.\n.0000.00..000..00000..00..\n"

    assert_equal "Xo6oX7b", decryptor.decrypt(raw_braille)
  end
end
