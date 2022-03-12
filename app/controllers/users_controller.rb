class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    # @user = User.find(params[:id])
    @wardrobes = current_user.wardrobes
    @wardrobe = Wardrobe.new
    @events = current_user.events
    # @event = @user.events.first
    @post_images = current_user.post_images.page(params[:page])
    @events = Event.page(params[:page]).per(3).reverse_order
  end

  def search
    @user = User.find(params[:user_id])
    @wardrobes = @user.wardrobes
    @wardrobe = Wardrobe.new
    if params[:created_at] == ""
      @search_wardrobe = "日付を選択してください"
    else
      create_at = params[:created_at]
      @search_wardrobe = @wardrobes.where(['created_at LIKE ? ', "#{create_at}%"]).count
    end
  end

  def index
    @users = User.all
    @wardrobe = Wardrobe.new
    @events = current_user.events
    # respond_to do |format|
    #   format.html { render 'index' }
    #   format.json { render json: @events}
    # end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def destroy
    wardrobes = Wardrobe.find(params[:id])
    wardrobes.destroy
    flash[:notice] = "successfully destroyed."
    redirect_to wardrobes_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to users_path(current_user)
    else
      render :edit
    end
  end
  
  # def favorites
  #   favorites = favorite.where(user_id: @user.id).pluck(:post_id)
  #   @favorite_posts = Post.find(favorites)
  # end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
