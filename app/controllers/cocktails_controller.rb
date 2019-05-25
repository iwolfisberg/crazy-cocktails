class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end
end
