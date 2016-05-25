require_relative 'braille_decryptor'
require_relative 'num_encryptor'
require 'pry'

class Encryptor
  attr_accessor :encrypted_text, :sorted_text
  def initialize
    encryptor = BrailleDecryptor.new
  end
  def parse(plain_text)
    @sorted_text = plain_text.chomp
  end

  def setup_to_translate
    if @sorted_text.chars.any?{|char|char.upcase==char.downcase}
      num_encryptor = NumEncryptor.new
      num_encryptor.adjust(@sorted_text)
      @encrypted_text = num_encryptor.num_setup
    elsif text.chars.any?{|char|char==char.upcase}
      translate(cap_fit(@sorted_text))
    else
      translate(@sorted_text)
    end
  end

  def cap_fit(text)
    cap_sort = text.chars.find_all do |letter|
      letter==letter.upcase && letter!=letter.downcase
    end
    @sorted_text = text
    until cap_sort.count==0
      @sorted_text = @sorted_text.sub(cap_sort.first,"^"+"#{cap_sort.shift.downcase}")
    end
  end


  def translate(adjusted_text)
    @sorted_text = @sorted_text.chars.map do |letter|
      encryptor.decipher.key(letter).join
    end
    @encrypted_text = @sorted_text.map do |key|
      key.chars.each_slice(2).map(&:join)
    end
  end
end
