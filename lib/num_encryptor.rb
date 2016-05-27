require_relative 'encryptor'
require 'pry'

class NumEncryptor
  attr_reader :num_adjusted_encryption, :text_encryptor, :num_encryptor
  def initialize
    @num_adjusted_encryption = Array.new
    @text_encryptor = BrailleDecryptor.new.decipher.invert
    @num_encryptor = BrailleDecryptor.new.decipher_integers.invert
    @encryptor = Encryptor.new
    @encrypted_num = Array.new
  end

  def split_text(plain_text)
    plain_text.chars
  end

  def num_check(plain_text)
    # binding.pry
    if split_text(plain_text).any?{|lett|(0..9).any?{|num|num.to_s==lett}}
      find_num(plain_text)
    end
  end

  def find_num(plain_text)
    isolated_numbers = split_text(plain_text).find_all do |char|
      (0..9).any?{|num|num.to_s==char}
    end
    num_adjust(split_text(plain_text),isolated_numbers)
  end

  def num_adjust(split_text,isolated_numbers)
    isolated_numbers.reduce(split_text) do |stack,num|
      if split_text.map{|text|text==num}
        stack << "#"
        stack << num
      end
    end
    binding.pry
  end

end



  # def num_adjust(text)
  #   binding.pry
  #   text.chars.reduce(@num_adjusted_encryption) do |adj_text,char|
  #     if char.upcase==char.downcase && adj_text.last.downcase!=adj_text.last.upcase
  #       adj_text << "#"
  #       adj_text << char
  #     else
  #       adj_text << char
  #     end
  #   end
  #   @num_adjusted_encryption
  #   # binding.pry
  #   num_encrypt
  # end
  #
  # def num_encrypt
  #   unless @num_adjusted_encryption.first=="#" || @num_adjusted_encryption.count==0
  #     @num_adjusted_encryption.reduce(@encrypted_num) do |compiler,text|
  #       unless @text_encryptor[@encrypted_num.last]=="#"
  #       compiler << @text_encryptor[text]
  #       else
  #       num_translate
  #       end
  #     end
  #   else
  #     if @num_adjusted_encryption.count==0
  #     @encrypted_num << @text_encryptor[@num_adjusted_encryption.shift]
  #     num_translate
  #     end
  #   end
  #   binding.pry
  #   @encrypted_num
  # end
  #
  # def num_translate
  #   @num_adjusted_encryption.reduce(@encrypted_num) do |compiler,text|
  #     compiler << @num_encryptor[text]
  #     if @text_encryptor[@encrypted_num.last=="#"]
  #       @encrypted_num.last == @text_encryptor[@encrypted_num.last]
  #       num_encrypt
  #       break
  #     end
  #   end
  #   binding.pry
  #   @encrypted_num
  # end
    # binding.pry
    # binding.pry

    # num_sort = text.chars.find_all{|char|char.downcase==char.upcase}
    # until num_sort.count==0
    #   @pound_adjustment = text.sub!(num_sort.first,"#" + "#{num_sort.shift}" + "#")
    # end
    # # binding.pry
    # # => @pound_adjustment = "ham#5#t#3#r"
    # # binding.pry
    # if @pound_adjustment.chars.any?{|letter|letter==letter.upcase && letter!=letter.downcase}
    #   @pound_adjustment = @fitter.cap_fit(@pound_adjustment)
    # end
    # @pound_adjustment = @pound_adjustment.chars

  #
  # def num_setup
  #   until @pound_adjustment.first=="#"
  #     @num_adjusted_encryption << @text_encryptor[@pound_adjustment.shift]
  #     if @pound_adjustment.empty?
  #       break
  #     end
  #   end
  #   # binding.pry
  #   if @pound_adjustment.empty?
  #     @num_adjusted_encryption
  #   else
  #     @num_adjusted_encryption << @text_encryptor[@pound_adjustment.shift]
  #     num_translate
  #   end
  # end
  #
  # def num_translate
  #   unless @pound_adjustment.empty?
  #     until @pound_adjustment.first=="#"
  #       @num_adjusted_encryption << @num_encryptor[@pound_adjustment.shift]
  #       if @pound_adjustment.empty?
  #         break
  #       end
  #     end
  #     if @pound_adjustment.empty?
  #       @num_adjusted_encryption
  #     else
  #       @num_adjusted_encryption << @text_encryptor[@pound_adjustment.shift]
  #       num_setup
  #     end
  #     if @num_adjusted_encryption.last==nil
  #     @num_adjusted_encryption.pop
  #     @num_adjusted_encryption
  #     end
  #   end
  # end
