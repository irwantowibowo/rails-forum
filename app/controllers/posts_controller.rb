class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@post = Post.order("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(resources_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @post.update(resources_params)
   			redirect_to @post
	  	else
	   		render 'edit'
	  	end
	end

	def destroy
		@post.destroy
		redirect_to @post
	end

	private
		def resources_params
			params.require(:post).permit(:title, :content)
		end

		def find_post
			@post = Post.find(params[:id])
		end
end
