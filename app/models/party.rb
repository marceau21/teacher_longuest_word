class Party < ApplicationRecord
  belongs_to :game
  has_many :solutions

  def sampled_letters
    vowells = ['a', 'e', 'i','o','u']
      letters = ('a'..'z').to_a
      consonants = letters - vowells
      #TODO: put uncomment first line before prod launch
      # sample = vowells.sample(5) + consonants.to_a.sample(5)
      sample = ['a', 'b', 'a', 'n', 'd', 'o', 'n']
  end
end
