
require 'pry-byebug'

class CheckWord

  attr_accessor :word, :ten_letters_list

  def initialize(word, ten_letters_list)
    @word = word
    @ten_letters_list = ten_letters_list
  end

  def is_valid?
    # binding.pry
    @word.chars.each { |letter| @ten_letters_list.include?(letter) ? letter : false }
    dictionnary.include?(@word.upcase)
  end
  # private

   def dictionnary
    path = File.join(Rails.root, 'db', 'liste_francais.txt')
    dictionnary = []
    File.open(path, 'rb', encoding: "ISO8859-1:utf-8").each do |line|
      if (line.length < 10 && !line.include?("-"))
        # TODO: rewrite this line
        dictionnary << line.mb_chars.unicode_normalize(:nfkc).gsub(/[^\x00-\x7F]/n,'').upcase.to_s.strip
      end
    end
    dictionnary
  end

end
