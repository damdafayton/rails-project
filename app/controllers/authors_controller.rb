class AuthorsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = begin
      User.find(params[:id])
    rescue StandardError
      nil
    end
    @user_posts = Post.where(author_id: params[:id])
    @user_posts_length = @user_posts.length
    @user_posts = @user_posts.limit(3)
  end
end
