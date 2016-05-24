require 'pry'
class BrailleDecryptor
  attr_reader :decipher, :decrypted_braille
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
                  ["..","..",".0"] => "^"
                  }
    end



    def decrypt(raw_braille)
      formatter = DecryptionFormatter.new
      formatter.parse_braille(raw_braille)
      formatter.format_content
      @decrypted_braille = formatter.sorted_braille.map{|code|@decipher[code]}
      if @decrypted_braille.any?{|letters|letters=="^"}
        self.cap_fit
      end
    end

    def cap_fit
      if @decrypted_braille.first == ("^")
        @decrypted_braille = @decrypted_braille.join.split("^").map{|code|code.capitalize}.join
      else
        @decrypted_braille = @decrypted_braille.join.split("^").map{|code|code.capitalize}
        @decrypted_braille[0].downcase!
        @decrypted_braille = @decrypted_braille.join
      end
    end
  end
