class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @wardrobe = Wardrobe.find(params[:wardrobe_id])
    favorite = @wardrobe.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @wardrobe = Wardrobe.find(params[:wardrobe_id])
    favorite = @wardrobe.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end
end
