class HomeController < ApplicationController
  
  def top
    @posts = Post.order(created_at: :desc)
  end
end
