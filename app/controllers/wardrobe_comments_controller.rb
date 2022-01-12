class WardrobeCommentsController < ApplicationController
  before_action :authenticate_user!

	def create
		@wardrobe = Wardrobe.find(params[:wardrobe_id])
		@wardrobe_comment = WardrobeComment.new(wardrobe_comment_params)
		@wardrobe_comment.wardrobe_id = @wardrobe.id
		@wardrobe_comment.user_id = current_user.id
		if @wardrobe_comment.save
			redirect_to wardrobe_path(@wardrobe.id)
		else
			render 'wardrobes/show'
		end
	end


	def destroy
	  wardrobe_comment = WardrobeComment.find_by(id: params[:id], wardrobe_id: params[:wardrobe_id])
	  wardrobe_comment.destroy
	  redirect_to request.referer
	end

	private
	def wardrobe_comment_params
		params.require(:wardrobe_comment).permit(:comment , :user_id, :wardrobe_id)
	end
end
