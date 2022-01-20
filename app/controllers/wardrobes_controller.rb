class WardrobesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @wardrobe = Wardrobe.find(params[:id])
    @newwardrobe = Wardrobe.new
    @user = @wardrobe.user
    @wardrobe_comment = WardrobeComment.new
    @wardrobes = Wardrobe.page(params[:page]).reverse_order
  end

  def index
    @wardrobe = Wardrobe.new
    @wardrobes = Wardrobe.page(params[:page]).reverse_order
  end

  def create
    @wardrobe = Wardrobe.new(wardrobe_params)
    @wardrobe.user_id = current_user.id
    if @wardrobe.save
      redirect_to wardrobe_path(@wardrobe), notice: "successfully."
    else
      @wardrobes = Wardrobe.all
      render 'index'
    end
  end

  def edit
    @wardrobe = Wardrobe.find(params[:id])
     if @wardrobe.user == current_user
            render "edit"
     else
            redirect_to wardrobes_path
     end
  end

  def update
    @wardrobe = Wardrobe.find(params[:id])
    if @wardrobe.update(wardrobe_params)
      flash[:notice] = "updated successfully."
      redirect_to wardrobe_path(@wardrobe)
    else
      render :edit
    end
  end

  def destroy
    @wardrobe = Wardrobe.find(params[:id])
    @wardrobe.destroy
    redirect_to wardrobes_path
  end

  private

  def wardrobe_params
    params.require(:wardrobe).permit(:title, :body)
  end

  def ensure_correct_user
    @wardrobe = Wardrobe.find(params[:id])
    unless @wardrobe.user == current_user
      redirect_to wardrobes_path
    end
  end
end
