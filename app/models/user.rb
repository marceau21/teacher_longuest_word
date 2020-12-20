class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games

  def best_score
    scores = []
    self.games.each do |game|
      game_score = 0
      game.parties.each do |party|
        game_score += party.score
      end
      scores << game_score
    end
    scores.sort.reverse.first
  end
end
