gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decryptor'

class DecryptorTest < Minitest::Test
  def test_decrypt_a_character
    decryptor = Decryptor.new
    assert_equal "n", decryptor.decrypt("00\n.0\n0.")
    assert_equal "x", decryptor.decrypt("00\n..\n00")
    assert_equal "q", decryptor.decrypt("00\n00\n0.")
    assert_equal "t", decryptor.decrypt(".0\n00\n0.")
    assert_equal "!", decryptor.decrypt("..\n00\n0.")
    assert_equal "-", decryptor.decrypt("..\n..\n00")
  end

  def test_decrypt_capital_letters
    decryptor = Decryptor.new
    assert_equal "G", decryptor.decrypt("..\n..\n.000\n00\n..")
    assert_equal "Y", decryptor.decrypt("..\n..\n.000\n.0\n00")
    assert_equal "P", decryptor.decrypt("..\n..\n.000\n0.\n0.")
    assert_equal "T", decryptor.decrypt("..\n..\n.0.0\n00\n0.")
  end
end
