require_relative "num_decryptor"
require_relative "decryption_formatter"
require 'pry'
class BrailleDecryptor
  attr_reader :decipher, :decrypted_text, :decipher_integers
  attr_accessor :sorted_braille
  def initialize
    @decipher = {
                  ["0.","..",".."] => "a",
                  ["0.","0.",".."] => "b",
                  ["00","..",".."] => "c",
                  ["00",".0",".."] => "d",
                  ["0.",".0",".."] => "e",
                  ["00","0.",".."] => "f",
                  ["00","00",".."] => "g",
                  ["0.","00",".."] => "h",
                  [".0","0.",".."] => "i",
                  [".0","00",".."] => "j",
                  ["0.","..","0."] => "k",
                  ["0.","0.","0."] => "l",
                  ["00","..","0."] => "m",
                  ["00",".0","0."] => "n",
                  ["0.",".0","0."] => "o",
                  ["00","0.","0."] => "p",
                  ["00","00","0."] => "q",
                  ["0.","00","0."] => "r",
                  [".0","0.","0."] => "s",
                  [".0","00","0."] => "t",
                  ["0.","..","00"] => "u",
                  ["0.","0.","00"] => "v",
                  [".0","00",".0"] => "w",
                  ["00","..","00"] => "x",
                  ["00",".0","00"] => "y",
                  ["0.",".0","00"] => "z",
                  ["..","00","0."] => "!",
                  ["..","..","0."] => "'",
                  ["..","0.",".."] => ",",
                  ["..","..","00"] => "-",
                  ["..","00",".0"] => ".",
                  ["..","0.","00"] => "?",
                  ["..","..",".0"] => "^",
                  [".0",".0","00"] => "#",
                  }

    @decipher_integers = {[".0","00",".."] => "0",
                          ["0.","..",".."] => "1",
                          ["0.","0.",".."] => "2",
                          ["00","..",".."] => "3",
                          ["00",".0",".."] => "4",
                          ["0.",".0",".."] => "5",
                          ["00","0.",".."] => "6",
                          ["00","00",".."] => "7",
                          ["0.","00",".."] => "8",
                          [".0","0.",".."] => "9"}

    end



    def decrypt(raw_braille)
      formatter = DecryptionFormatter.new(raw_braille)
      @sorted_braille_by_char = formatter.parse_lines
      num_check
      cap_check
    end

    def num_check
      if @sorted_braille_by_char.any?{|braille_letter|@decipher[braille_letter]=="#"}
        num_decrypt
      else
        cap_check
      end
    end

    def cap_check
      if @sorted_braille_by_char.any?{|braille_letter|@decipher[braille_letter]=="^"}
        num_decrypt
        cap_find
      else
        translate
      end
    end

    def num_decrypt
      num_decryptor = NumDecryptor.new
      @decrypted_text = num_decryptor.num_fit(@sorted_braille_by_char).chars
    end

    def cap_find
      if @decrypted_text[0] == ("^")
        @decrypted_text = decrypted_text.join.split("^").map{|code|code.capitalize}.join
      else
        @decrypted_text = decrypted_text.join.split("^").map{|code|code.capitalize}.join
        @decrypted_text[0] = @decrypted_text[0].downcase!
        @decrypted_text
      end
    end

    def translate
      if @sorted_braille_by_char.join.length <=6
        @decrypted_text = @decipher[@sorted_braille_by_char.flatten]
      else
        @decrypted_text = @sorted_braille_by_char.map{|braille|@decipher[braille]}.join
      end
    end
    #
    #
    #
    #
    #
    #
    #
    #
    #
    # def ready_and_decrypt
    #   # caps_check = @sorted_braille.any?{|letters|@decipher[letters]=="^"}
    #   # num_check = @sorted_braille.any?{|letter|@decipher[letter]=="#"}
    #   # if num_check || caps_check
    #     num_decryptor = NumDecryptor.new
    #     num_decryptor.num_adjust(@sorted_braille_by_char)
    #     # @decrypted_text = num_decryptor.decrypted_text
    #   #   if caps_check
    #   #     cap_fit(@decrypted_text.chars)
    #   #   end
    #   # elsif @sorted_braille.all?{|code|code.count==1}
    #   #   @decrypted_text = @decipher[@sorted_braille.flatten]
    #   # else
    #   #   @decrypted_text = @sorted_braille.map{|code|@decipher[code]}.join
    #   # end
    # end



  end
