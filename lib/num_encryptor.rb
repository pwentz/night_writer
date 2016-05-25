require_relative 'encryptor'
require 'pry'

class NumEncryptor
  attr_reader :num_adjusted_encryption
  def initialize
    @num_adjusted_encryption = Array.new
    @text_encryptor = BrailleDecryptor.new.decipher.invert
    @num_encryptor = BrailleDecryptor.new.decipher_integers.invert
    @fitter = BrailleDecryptor.new
  end

  def num_adjust(text)
    num_sort = text.chars.find_all{|char|char.downcase==char.upcase}
    until num_sort.count==0
      @pound_adjustment = text.sub!(num_sort.first,"#" + "#{num_sort.shift}" + "#")
    end
    # binding.pry
    # => @pound_adjustment = "ham#5#t#3#r"
    if @pound_adjustment.any?{|letter|letter=letter.upcase && letter!=letter.downcase}
      @pound_adjustment = @fitter.cap_fit(@pound_adjustment)
    end
    @pound_adjustment = @pound_adjustment.chars
  end

  def num_setup
    until @pound_adjustment.first=="#"
      @num_adjusted_encryption << @text_encryptor[@pound_adjustment.shift]
      if @pound_adjustment.empty?
        break
      end
    end
    @num_adjusted_encryption << @text_encryptor[@pound_adjustment.shift]
    num_translate
  end

  def num_translate
    unless @pound_adjustment.empty?
      until @pound_adjustment.first=="#"
        @num_adjusted_encryption << @num_encryptor[@pound_adjustment.shift]
        if @pound_adjustment.empty?
          break
        end
      end
      @num_adjusted_encryption << @text_encryptor[@pound_adjustment.shift]
      num_setup
    end
    @num_adjusted_encryption = @num_adjusted_encryption.join
  end
end
