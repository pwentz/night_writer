gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decryption_formatter'
require 'pry'

class DecryptionFormatterTest < Minitest::Test


  def test_formatter_can_evenly_divide_parsed_lines
    
    formatter = DecryptionFormatter.new(".0.00000\n000..0..\n....0.00\n")
    formatter.parse_lines


    assert_equal 24, formatter.parsed_content.join.length
    assert formatter.parsed_content.count==3
    assert formatter.parsed_content.all?{|nest|nest.join.length==8}
    assert formatter.parsed_content.all?{|nest|nest.count==4}
  end

  def test_formatter_can_concat_corresponding_braille_contents
    
    formatter = DecryptionFormatter.new
    formatter.parse_braille(".0.00000\n000..0..\n....0.00\n")

    formatter.format_content

    assert_equal 24, formatter.sorted_braille.join.length
    assert formatter.sorted_braille.count==4
    assert formatter.sorted_braille.all?{|nest|nest.join.length==6}
    assert formatter.sorted_braille.all?{|nest|nest.count==3}

  end
end
