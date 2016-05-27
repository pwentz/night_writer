require 'pry'
class EncryptionFormatter
  attr_reader :final_encryption, :formatted_encryption
  def initialize(encrypted_text)
    @encrypted_text = encrypted_text
    @formatted_encryption = Array.new
    format
  end

  def format
    until @encrypted_text.all?{|nests|nests.empty?}
      @formatted_encryption.push(@encrypted_text.map{|nest|nest[0+0+0]})
      @encrypted_text.each{|nest|nest.shift}
    end
    # binding.pry
    @final_encryption = formatted_encryption.map{|line|line.push("\n")}.join
  end
end
