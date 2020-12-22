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
    check = CheckWord.new(@party.word, @party.ten_letters_list)
    if check.is_valid? && check.exists?
      @party.available = true
      @party.score = @party.word.length
      @party.save
      check.ten_best_answers.each {|answer| Solution.create(word: answer, party_id: @party.id)}
      redirect_to party_path(@party)
    else
      redirect_to new_party_path, notice: "hum... ce mot n'est pas terrible"
    end

  end

  def show
    @game = current_game
    @party = Party.find(params[:id])
    @score = @party.score
    # binding.pry
    @solutions = Solution.where(party_id: @party.id)

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

