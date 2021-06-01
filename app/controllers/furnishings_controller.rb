class FurnishingsController < ApplicationController
  def index
    @furnishings = Furnishing.all
  end

  def show
    @furnishing = Furnishing.find(params[:id])
  end

  def new
    @furnishing = Furnishing.new
  end

  def create
    @furnishing = Furnishing.new(strong_params)
    if @furnishing.save
      redirect_to furnishing_path(@furnishing)
    else
      render :new
    end
  end

  def edit
    @furnishing = Furnishing.find(params[:id])
  end

  def update
    @furnishing = Furnishing.find(params[:id])
    if @furnishing.update(strong_params)
      redirect_to furnishing_path(@furnishing)
    else
      render :edit
  end

  def destroy
    @furnishing = Furnishing.find(params[:id])
    @furnishing.destroy
    redirect_to furnishings_path
  end

  private

  def strong_params
    params.require(:furnishing).permit(:title, :description, :price, :location, :furnishing_type)
end
