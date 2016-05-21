gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/braille_decryptor'
require 'pry'

class BrailleDecryptorTest < Minitest::Test
  def test_decrypt_a_character
    decryptor = BrailleDecryptor.new
    # binding.pry
    assert_equal "n", decryptor.decrypt("00.00.")
    assert_equal "x", decryptor.decrypt("00..00")
    assert_equal "q", decryptor.decrypt("00000.")
    assert_equal "t", decryptor.decrypt(".0000.")
    assert_equal "!", decryptor.decrypt("..000.")
    assert_equal "-", decryptor.decrypt("....00")
  end

  def test_decrypt_multiple_letters

    decryptor = BrailleDecryptor.new
    assert_equal "ab", decryptor.decrypt("0.....0.0...")
    assert_equal "bfg", decryptor.decrypt("0.0...000...0000..")
    assert_equal "cats", decryptor.decrypt("00....0......0000..00.0.")
    assert_equal "hammer", decryptor.decrypt("0.00..0.....00..0.00..0.0..0..0.000.")
  end
end
