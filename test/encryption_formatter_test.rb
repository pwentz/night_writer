gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encryption_formatter'
require 'pry'

class EncryptionFormatterTest < Minitest::Test
  def test_formatter_can_format_single_lines
    text = [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]
    line1 = ["0.","0.","00"] << "\n"
    line2 = ["..","0.",".."] << "\n"
    line3 = ["..","..",".."] << "\n"
    formatter = EncryptionFormatter.new(text)
    # binding.pry
    assert_equal line1, formatter.formatted_encryption.first
    assert_equal line2, formatter.formatted_encryption[1]
    assert_equal line3, formatter.formatted_encryption.last
  end

  def test_formatter_can_convert_to_file_readable_string
    
    text = [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]
    line1 = ["0.","0.","00"]
    line2 = ["..","0.",".."]
    line3 = ["..","..",".."]
    file_text = line1.join + "\n" + line2.join + "\n" + line3.join + "\n"
    formatter = EncryptionFormatter.new(text)


    assert_equal file_text, formatter.final_encryption
  end


end
