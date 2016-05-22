require_relative 'braille_decryptor'
require 'pry'

class Encryptor
  attr_accessor :encrypted_text
  def initialize(plain_text)
    @plain_text = plain_text
  end

  def parse
    encryptor = BrailleDecryptor.new
    braille_keys = @plain_text.chomp.chars.map do |letter|
      encryptor.decipher.key(letter).join
    end

    @encrypted_text = braille_keys.map do |key|
      key.chars.each_slice(2).map(&:join)
    end
  end
end
