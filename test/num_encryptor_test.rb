gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/num_encryptor'
require 'pry'

class NumEncryptorTest < Minitest::Test
  def test_encryptor_can_split_string_into_array
    num_encryptor = NumEncryptor.new
    plain_text = "go23"

    assert_instance_of Array, num_encryptor.num_check(plain_text)
  end

  def test_encryptor_can_recognize_numbers
    num_encryptor = NumEncryptor.new
    plain_text = "go23"

    assert num_encryptor.num_check(plain_text)
  end

  def test_encryptor_can_isolate_numbers
    num_encryptor = NumEncryptor.new
    plain_text = "go23"

    assert_equal ["2","3"], num_encryptor.num_check(plain_text)
  end

  def test_encryptor_can_compare_numbers_w_orig_array
    skip
    num_encryptor = NumEncryptor.new
    plain_text = "go23"


  end
end
