class StatsController < ApplicationController

  def new
    @stat = Stat.new
  end

  def show
    @stat = Stat.find(params[:id])
  end

  def create
    @stat = Stat.new(stat_params)
    if @stat.save
      flash[:success] = "Success! Here are your records"
      redirect_to stat_path(@stat)
    else
      flash.now[:failure] = "Records not found"
      render 'new'
    end
  end

  private

    def stat_params
      params.require(:stat).permit(:account_id)
    end
end
