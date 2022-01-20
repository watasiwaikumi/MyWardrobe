class SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
		# if @model == 'wardrobe'
		# 	@records = Wardrobe.search_for(@content, @method)
		# else
		# if @model == 'post_image'
		# 	@records = Post_image.search_for(@content, @method)
		# else
		# if @model == 'tag'
		# 	@records = Tag.search_for(@content, @method)
		# else
		# if @model == 'event'
		# 	@records = Event.search_for(@content, @method)
		# else
		end
	end
end
