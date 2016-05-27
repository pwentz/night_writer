gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/num_decryptor'

class NumDecryptorTest < Minitest::Test
  def test_decryptor_can_decrypt_just_numbers

    num_decryptor = NumDecryptor.new
    sorted_braille = [[".0", ".0", "00"], ["0.", "0.", ".."], ["00", "..", ".."]]

    num_decryptor.num_fit(sorted_braille)

    assert_equal "23", num_decryptor.decrypted_braille
  end
  def test_decryptor_can_decrypt_letters_and_numbers
    skip
    num_decryptor = NumDecryptor.new
    sorted_braille = [["00", "00", ".."], ["0.", ".0", "0."], [".0", ".0", "00"], ["0.", "0.", ".."], ["00", "..", ".."]]

    num_decryptor.num_fit(sorted_braille)

    assert_equal "go23", num_decryptor.decrypted_braille
  end

  def test_decryptor_can_decrypt_multiple_instances_of_numbers
    skip
    num_decryptor = NumDecryptor.new
    sorted_braille = [["00", "..", "00"], ["0.", ".0", "0."], [".0", ".0", "00"], ["00", "0.", ".."], [".0", ".0", "00"],
    ["0.", ".0", "0."], ["00", "..", "00"], [".0", ".0", "00"], ["00", "00", ".."], [".0", ".0", "00"], ["0.", "0.", ".."]]

    num_decryptor.num_fit(sorted_braille)

    assert_equal "xo6ox7b", num_decryptor.decrypted_braille
  end
end
