class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_cocktail, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
