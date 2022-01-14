class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
    # tag_list=params[:post][:name].split(',')
    # if @post.save
    #   @post.save_tag(tag_list)
    #   redirect_to posts_path(@post),notice:'投稿完了しました:)'
    # else
    #   render:new
  end

  def index
    @post_images = PostImage.all
    # @post_images = PostImage.page(params[:page]).per(10)
    # @tag_list=Tag.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    # @post_comment=PostComment.new
    # @post_images = @post_image.tags
  end

  def edit
    @post_image = PostImage.find(params[:id])
    if @post_image.user == current_user
            render "edit"
    else
            redirect_to post_images_path
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:item_name, :image, :caption)
  end
end
