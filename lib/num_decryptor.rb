require 'pry'
require_relative 'braille_decryptor'
class NumDecryptor
  attr_reader :decrypted_braille
  def initialize
    @num_adjusted_decryption = Array.new
    @decryptor = BrailleDecryptor.new
    @decrypted_text = Array.new
  end


  def num_fit(formatted_braille)
    binding.pry
    formatted_braille.reduce(@decrypted_text) do |stack,braille|
      if stack.count==0
        stack << @decryptor.decipher[braille]
      elsif stack.last=="#"
        unless stack[-2].upcase!=stack[-2].downcase
          stack << @decryptor.decipher[braille]
        else
          stack << @decryptor.decipher_integers[braille]
        end
      elsif stack.last=="^"
        stack << @decryptor.decipher[braille].upcase
      elsif stack.last.upcase==stack.last.downcase
        stack << @decryptor.decipher_integers[braille]
      else
        stack << @decryptor.decipher[braille]
      end
    end
    # binding.pry
    num_sort
  end

  def num_sort
    @decrypted_text = @decrypted_text.join.gsub("#","")
    # binding.pry
  end
  #   @sorted_braille = sorted_braille
  #     until @decryptor.decipher[@sorted_braille.first]=="#"
  #       @sorted_nums.push(@decryptor.decipher[@sorted_braille.shift])
  #       if @sorted_braille.empty?
  #         break
  #       end
  #     end
  #     @sorted_braille.shift
  #     self.num_translate
  # end
  #
  # def num_translate
  #   unless @sorted_braille.empty?
  #     until @decryptor.decipher[@sorted_braille.first]=="#"
  #       @sorted_nums.push(@decryptor.decipher_integers[@sorted_braille.shift])
  #       if @sorted_braille.empty?
  #         break
  #       end
  #     end
  #     @sorted_braille.shift
  #     self.num_fit(@sorted_braille)
  #   else
  #     @decrypted_braille = @sorted_nums.join
  #     # binding.pry
  #     # self.cap_fit(@decrypted_braille)
  #   end





end
