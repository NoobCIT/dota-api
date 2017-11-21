class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def show
     @stats = Dota::Match.new(params[:match_id]).stats
   end
end
