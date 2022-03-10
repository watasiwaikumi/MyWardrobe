class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = Tag.page(params[:page]).per(20).reverse_order
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end

end
