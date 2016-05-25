require_relative "decryption_formatter"
require_relative "encryption_formatter"
require_relative "encryptor"

require 'pry'
class NightWriter
  attr_reader :decrypted_braille
  def initialize
    @decrypted_braille
  end

  def decrypt
    raw_braille = File.read(ARGV[0])
    decryptor = BrailleDecryptor.new
    decryptor.decrypt(raw_braille)
    File.write(ARGV[1], decryptor.decrypted_braille)
  end

  def encrypt
    plain_text = File.read(ARGV[0])
    encryptor = Encryptor.new
    encryptor.parse(plain_text)
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
