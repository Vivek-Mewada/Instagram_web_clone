class HomesController < ApplicationController
  
  def index
    # debugger
    @posts = Post.all
  end

end