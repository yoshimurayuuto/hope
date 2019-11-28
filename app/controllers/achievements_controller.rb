class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.all
  end

  def new
    @achievement = Achievement.new
  end
end
