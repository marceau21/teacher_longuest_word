require 'pry-byebug'
class PartiesController < ApplicationController
  def new
    game_init
    @letters = sampled_letters
    binding.pry
    # @party = Party.new
  end

  def create

  end

  def show

  end


end


