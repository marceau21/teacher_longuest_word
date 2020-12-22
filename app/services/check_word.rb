
require 'pry-byebug'

class CheckWord

  attr_accessor :word, :ten_letters_list

  def initialize(word, ten_letters_list)
    @word = word
    @ten_letters_list = ten_letters_list
  end

  def is_valid?
    return true if (@word.chars - @ten_letters_list.chars).size < 10
  end

  def exists?
    dictionnary.include?(@word.upcase)
  end

  def ten_best_answers
    results = []
    dictionnary.each do |word|
      ten_letters = @ten_letters_list.upcase.chars
      word.chars.each { |letter| ten_letters.include?(letter) ? ten_letters.delete_at(ten_letters.index(letter)) : false }
      results << word if word.length == (@ten_letters_list.length - ten_letters.length)
    end
    return results.sort{|x, y| x.length <=> y.length}.last(10)
  end

  private

  # TODO: create a model dictionnary
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
