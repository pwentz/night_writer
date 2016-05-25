require 'pry'
class NumDecryptor
  attr_reader :decrypted_braille
  def initialize
    @sorted_nums = Array.new
    @decryptor = BrailleDecryptor.new
  end

  def num_fit(sorted_braille)
    @sorted_braille = sorted_braille
      until @decryptor.decipher[@sorted_braille.first]=="#"
        @sorted_nums.push(@decryptor.decipher[@sorted_braille.shift])
        if @sorted_braille.empty?
          break
        end
      end
      @sorted_braille.shift
      self.num_translate
  end

  def num_translate
    unless @sorted_braille.empty?
      until @decryptor.decipher[@sorted_braille.first]=="#"
        @sorted_nums.push(@decryptor.decipher_integers[@sorted_braille.shift])
        binding.pry
        if @sorted_braille.empty?
          break
        end
      end
      @sorted_braille.shift
      self.num_fit(@sorted_braille)
    else
      @decrypted_braille = @sorted_nums.join
      self.cap_fit(@decrypted_braille)
    end
  end

  def cap_fit(decrypted_braille)
    if decrypted_braille[0] == ("^")
      @decrypted_braille = decrypted_braille.split("^").map{|code|code.capitalize}.join
    else
      @decrypted_braille = decrypted_braille.split("^").map{|code|code.capitalize}.join
      @decrypted_braille[0] = @decrypted_braille[0].downcase!
      @decrypted_braille
    end
  end


end
