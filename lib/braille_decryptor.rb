require_relative "num_decryptor"
require 'pry'
class BrailleDecryptor
  attr_reader :decipher, :decrypted_braille, :decipher_integers
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
      formatter = DecryptionFormatter.new
      formatter.parse_braille(raw_braille)
      @sorted_braille = formatter.format_content
      caps_check = @sorted_braille.any?{|letters|@decipher[letters]=="^"}
      num_check = @sorted_braille.any?{|letter|@decipher[letter]=="#"}
      num_decryptor = NumDecryptor.new
      if caps_check && num_check
        num_decryptor.num_fit(@sorted_braille)
        @decrypted_braille = num_decryptor.decrypted_braille
      elsif caps_check
        @decrypted_braille = num_decryptor.cap_fit(@sorted_braille.map{|code|@decipher[code]})
      else
        @decrypted_braille = @sorted_braille.map{|code|@decipher[code]}
      end
    end


  end
