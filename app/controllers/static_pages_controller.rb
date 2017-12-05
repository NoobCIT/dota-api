class StaticPagesController < ApplicationController

  def new
    @stat = Stat.new
  end

  def create
    @stat = Stat.new(stat_params)
  end

  def home
  end

  private

    def stat_params
      params.require(:stat).permit(:account_id)
    end
end
