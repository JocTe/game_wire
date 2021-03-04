class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home
    
    def home
      @games = Game.all
    end

    def show
      @user = current_user
      @games = policy_scope(Game)
      authorize @games
    end
end
