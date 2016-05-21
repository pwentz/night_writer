require_relative 'content_parser'
require_relative "braille_parser"
require_relative "braille_decryptor"
require 'pry'

    contents = File.read(ARGV[0])

    content_parser = ContentParser.new(contents)
    decryptor = BrailleDecryptor.new
    
    content_parser.parse_file
    content_parser.format_content
    formatted_braille = content_parser.sorted_braille
    # binding.pry
    decrypted_braille = formatted_braille.map {|letter| decryptor.decipher[letter]}.join

    File.write(ARGV[1], decrypted_braille)
