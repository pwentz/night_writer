require_relative 'braille_decryptor'
require_relative 'night_writer'

class EnglishParser
  attr_reader: sorted_keys, parsed_keys
  def initialize(decrypted_braille)
    @decrypted_braille = decrypted_braille
    @parsed_keys = Array.new
  end

  def parse
    string_keys = decrypted_braille.chars.map do |letter|
      decryptor.decipher.key(letter)}.join
    end

    arr_keys = string_keys.chars.each_slice(6).map(&:join)
    @sorted_keys = arr_keys.map do |key|
      key.chars.each_slice(2).map(&:join)
    end
  end

  def format_encryption
    until @sorted_keys.all?{|nests|nests.empty?}
      @parsed_keys.push(@sorted_keys.map{|nest|nest[0+0+0]}
      @sorted_keys.each{|nest|nest.shift}
    end
  end

end
