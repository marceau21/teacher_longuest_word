require 'pry-byebug'
class PartiesController < ApplicationController
  def new
    game_initialization
    @letters = Party.sampled_letters
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    @party.game = current_game
    # binding.pry

  end

  def show

  end

  private

  def game_initialization
    if (current_user.games.blank? || current_user.games.last.parties.length == 5)
      game = Game.create!(user_id: current_user.id)
    else
      game = current_game
    end
  end

  def party_params
    params.require(:party).permit(:word, :ten_letters_list)
  end

  def current_game
    current_user.games.last
  end


end


