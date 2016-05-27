require_relative 'braille_decryptor'
require_relative 'num_encryptor'
require 'pry'

class Encryptor
  attr_accessor :encrypted_text, :sorted_text


  def setup_to_translate(plain_text)
    @sorted_text = plain_text.chomp
    num_check
  end

  def num_check
    if @sorted_text.chars.any?{|char|char.upcase==char.downcase}
      num_encrypt
      formatter_prep
    else
      cap_check
      translate
    end
  end

  def num_encrypt
    num_encryptor = NumEncryptor.new
    @sorted_text = num_encryptor.num_adjust(@sorted_text)
    cap_check
  end

  def cap_check
    if @sorted_text.chars.any?{|char|char==char.upcase&&char!=char.downcase}
      cap_adjust
    end
  end

  def cap_adjust
    cap_sort = @sorted_text.chars.find_all do |letter|
      letter==letter.upcase && letter!=letter.downcase
    end
    until cap_sort.count==0
      @sorted_text = @sorted_text.sub(cap_sort.first,"^"+"#{cap_sort.shift.downcase}")
    end
    @sorted_text
  end


  #
  #     @encrypted_text=num_encryptor.num_adjust(@sorted_text)
  #   elsif @sorted_text.chars.any?{|char|char==char.upcase}
  #     translate(cap_fit(@sorted_text))
  #   else
  #     translate(@sorted_text)
  #   end
  # end



  def translate
    encryptor = BrailleDecryptor.new
    @sorted_text = @sorted_text.chars.map do |letter|
      encryptor.decipher.key(letter).join
    end
    # binding.pry
    formatter_prep
  end

  def formatter_prep
    @encrypted_text = @sorted_text.map do |key|
    key.chars.each_slice(2).map(&:join)
    end
  end
end
