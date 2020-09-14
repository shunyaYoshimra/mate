class Api::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :destroy]
  def index
    post = Post.find(params[:id])
    @comments = post.comments.all
    render :index, formats: :json, handlers: :jbuilder
  end

  def show
    render :show, formats: :json, handlers: :jbuilder
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:id]
    if @comment.save
      render :show, formats: :json, hnadlers: :jbuilder
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    head :ok
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
