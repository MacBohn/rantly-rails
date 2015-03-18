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

  def edit
    @rant = Rant.find(params[:id])
    render :edit
  end

  def update
    @rant = Rant.find(params[:id])
    if @rant.update(params.require(:rant).permit(:title, :body, :user_id))
      redirect_to root_path
    else
      render :edit
    end
  end

end
