class PostImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @post_image = PostImage.new
    @wardrobes = current_user.wardrobes
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    tag_list = params[:post_image][:tag_name].delete(' ').delete('　').split(',')
    if @post_image.save
      #制作したタグと自動生成されたタグを合わせて
      tags = Vision.get_image_data(@post_image.image)
      @post_image.save_post_images(tag_list + tags)
      # binding.irb
      redirect_to post_images_path, success: 'Succsess!!'
    else
      flash.now[:danger] = 'Faild!!'
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order
    if params[:tag_id]
      @tag_list = Tag.all
      @tag = Tag.find(params[:tag_id])
      @post_images = @tag.post_images.order(created_at: "DESC").page(params[:page]).per(6)
      # @post_images_side = Post_tag.order(created_at: "DESC")
    else
      @tag_list = Tag.all
      @post_images = PostImage.order(created_at: "DESC").page(params[:page]).per(6)
      @post_images_side = PostImage.order(created_at: "DESC")
    end
    # respond_to do |format|
    # format.html
    # format.rss { render :layout => false }
    # end
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
    if @post_image.user != current_user
      redirect_to post_images_path
    end

    @wardrobes = current_user.wardrobes
    @tag_list = @post_image.tags.pluck(:name).join(',')
  end

  def update
    @post_image = current_user.post_images.find(params[:id])
    tag_list = params[:post_image][:tag_name].delete(' ').delete('　').split(',')
    if @post_image.update(post_image_params)
      @post_image.save_post_images(tag_list)
      redirect_to post_images_path, success: 'Conpleted!!'
    else
      flash.now[:danger] = 'Not update'
      render :edit
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:item_name, :image, :caption, :wardrobe_id)
  end
end
