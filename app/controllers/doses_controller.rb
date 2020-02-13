class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:descritpion, :ingredient_id)
  end
end

# def create
#     @review = Review.new(review_params)
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @review.restaurant = @restaurant
#     if @review.save
#       redirect_to restaurant_path(@restaurant)
#     else
#       render :new
#     end
#   end
