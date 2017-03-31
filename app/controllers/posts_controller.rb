class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
	  if params[:keyword]
        @posts = Post.where( [ "title like ?", "%#{params[:keyword]}%" ] )
      else
	    @posts = Post.all
	  end
	  
	  if params[:order]
	  	sort_by = (params[:order] == 'title') ? 'title' : 'id'
	  	@posts = @posts.order(sort_by)
	  end
	  
	  @posts = @posts.all.order("created_at DESC").paginate(page: params[:page], per_page: 2)
    end
    # GET /posts/latest
	def latest
		@posts = Post.order("id DESC").limit(10)
	end

    def show
  	
    end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
      redirect_to @post, notice: "Your article was successfully saved!"
		else
      render 'new', notice: "Oh no, I was unable to save your post."
		end
	end

	def edit
		
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: " Your article was succesful saved!"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end


	private

	def post_params
		params.require(:post).permit(:title, :content, :slug, :category_id, :image)
	end
  
  def find_post
  	@post = Post.friendly.find(params[:id])
  end



end
