gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encryptor'
require 'pry'

class EncryptorTest < Minitest::Test
  def test_encryptor_can_translate_and_group_single_chars
    skip
    encryptor = Encryptor.new
    text1 = "n"
    text2 = "x"
    text3 = "q"
    text4 = "t"


    assert_equal [["00",".0","0."]], encryptor.setup_to_translate(text1)
    assert_equal [["00","..","00"]], encryptor.setup_to_translate(text2)
    assert_equal [["00","00","0."]], encryptor.setup_to_translate(text3)
    assert_equal [[".0","00","0."]], encryptor.setup_to_translate(text4)
  end

  def test_encryptor_can_translate_and_group_multiple_chars
    skip
    encryptor = Encryptor.new
    text1 = "ab"
    text2 = "bfg"
    text3 = "cats"
    text4 = "hammer"

    assert_equal [["0.","..", ".."],["0.","0.",".."]], encryptor.setup_to_translate(text1)
    assert_equal [["0.","0.",".."],["00","0.",".."],["00","00",".."]], encryptor.setup_to_translate(text2)
    assert_equal [["00","..",".."],["0.","..",".."],[".0","00","0."],[".0","0.","0."]], encryptor.setup_to_translate(text3)
    assert_equal [["0.","00",".."],["0.","..",".."],["00","..","0."],["00","..","0."],["0.",".0",".."],["0.","00","0."]], encryptor.setup_to_translate(text4)
  end

  def test_encryptor_can_id_translate_group_words_w_caps
    skip
    encryptor = Encryptor.new
    text = "riSe"

    assert_equal [["0.","00","0."],[".0","0.",".."],["..","..",".0"],[".0","0.","0."],["0.",".0",".."]], encryptor.setup_to_translate(text)
  end

  def test_encryptor_can_id_translate_group_chars_w_nums
    
    encryptor = Encryptor.new
    text = "go23"

    assert_equal [["00","00",".."],["0.",".0","0."],[".0",".0","00"],["0.","0.",".."],["00","..",".."]], encryptor.setup_to_translate(text)
  end

  def test_encryptor_can_id_translate_group_chars_w_num_and_cap
    skip
    encryptor = Encryptor.new
    text = "to1noW"

    assert_equal [[".0","00","0."],["0.",".0","0."],[".0",".0","00"],["0.","..",".."],
    [".0",".0","00"],["00",".0","0."],["0.",".0","0."],["..","..",".0"],[".0","00",".0"]], encryptor.setup_to_translate(text)
  end

  def test_encryptor_can_id_translate_group_multiple_num_and_cap
    skip
    encryptor = Encryptor.new

  end

end
