class RantsController < ApplicationController

  def index
    @rants = Rant.all
  end

  def new
    @rant = Rant.new
  end

  def create
    @rant = Rant.new(params.require(:rant).permit(:title, :body, :user_id))
    if @rant.save
      redirect_to root_path
    else
      render :new
    end
  end

end
