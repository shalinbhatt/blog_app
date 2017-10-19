class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Successfully created post!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error Creating new post!"
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update_atttributes(post_params)
			flash[:notice] = "Successfully updated post"
			redirect_to post_path(@posts)
		else
			flash[:alert] = "Error updating post!"
			render :edit
		end
	end

	def show
	end

	def destroy
		if @post_destroy
			flash[:notice] = "Successfully deleted post"
			redirect_to @posts_paths
		else
			flash[:alert] = "Error deleting post"
		end
	end


private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
