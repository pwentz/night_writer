 require_relative 'braille_decryptor'
require 'pry'

class Encryptor
  attr_accessor :encrypted_text
  def initialize(plain_text)
    @plain_text = plain_text
    @sorted_text
  end

  def parse
    @sorted_text = @plain_text.chomp
    if @sorted_text.chars.any?{|chars|chars==chars.upcase}
      self.cap_fit
    else
      self.interpret
    end
  end

  def cap_fit
    cap_sort = @sorted_text.chars.find_all{|letter|letter==letter.upcase}
    until cap_sort.count==0
      @sorted_text = @sorted_text.sub(cap_sort.first,"^"+"#{cap_sort.shift.downcase}")
    end
    self.interpret
  end

  def interpret
    encryptor = BrailleDecryptor.new
    # binding.pry
    @sorted_text = @sorted_text.chars.map do |letter|
      encryptor.decipher.key(letter).join
    end
    @encrypted_text = @sorted_text.map do |key|
      key.chars.each_slice(2).map(&:join)
    end
  end
end
