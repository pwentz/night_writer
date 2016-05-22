require_relative 'content_parser'
require_relative "braille_parser"
require_relative "braille_decryptor"
require_relative "encryption_formatter"

require 'pry'
class NightWriter
  attr_reader :decrypted_braille
  def initialize
    @decrypted_braille
  end
  def decrypt
    contents = File.read(ARGV[0])

    content_parser = ContentParser.new(contents)
    decryptor = BrailleDecryptor.new

    content_parser.parse_file
    content_parser.format_content
    File.write(ARGV[1], content_parser.decrypted_braille)
  end

  def encrypt
    plain_text = File.read(ARGV[0])
    encryptor = Encryptor.new(plain_text)
    encryptor.parse
    formatter = EncryptionFormatter.new(encryptor.encrypted_text)
    formatter.format
    File.write(ARGV[1],formatter.final_encryption)
  end

  night_writer = NightWriter.new
  if File.readlines(ARGV[0]).count == 3
    night_writer.decrypt
  else
    night_writer.encrypt
  end

end
