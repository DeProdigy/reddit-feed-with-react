class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    post = Post.create(post_params)

    if post
      render json: post, status: :created
    else
      render status: :bad_request
    end
  end

  def destroy
    if Post.where(reddit_id: reddit_id).delete_all
      render nothing: true, status: :no_content
    else
      render status: :bad_request
    end
  end


  private

    def post_params
      params.require(:post).permit(:title, :score, :permalink, :url, :thumbnail, :reddit_id)
    end

    def reddit_id
      params[:id]
    end
end
