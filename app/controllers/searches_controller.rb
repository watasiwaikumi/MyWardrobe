class SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Wardrobe.search_for(@content, @method)
			@records = Post_image.search_for(@content, @method)
			@records = Tag.search_for(@content, @method)
			@records = Event.search_for(@content, @method)
		end
	end
end
