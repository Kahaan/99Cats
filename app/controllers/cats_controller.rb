class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to @cat
    else
      render @cat.errors.full_messages
    end
  end

  def edit
  end


private

  def cat_params
    params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
  end


end
