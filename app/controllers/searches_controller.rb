class SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)

		elsif @model == 'wardrobe'
			@records = Wardrobe.search_for(@content, @method)

		elsif @model == 'post_image'
			@records = PostImage.search_for(@content, @method)

		elsif @model == 'tag'
			@records = Tag.search_for(@content, @method)

		elsif @model == 'event'
			@records = Event.search_for(@content, @method)
			@records += Event.search_for2(@content, @method)
		else

		end
	end
end
