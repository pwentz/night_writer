require 'pry'
class EncryptionFormatter
  attr_reader :final_encryption
  def initialize(encrypted_text)
    @encrypted_text = encrypted_text
  end

  def format
    formatted_encryption = Array.new
    until @encrypted_text.all?{|nests|nests.empty?}
      formatted_encryption.push(@encrypted_text.map{|nest|nest[0+0+0]})
      @encrypted_text.each{|nest|nest.shift}
    end
    @final_encryption = formatted_encryption.map{|line|line.push("\n")}.join
  end
end
