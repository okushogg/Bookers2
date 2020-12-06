class RelationshipsController < ApplicationController

def follow
  current_user.follow(params[:id])
  redirect_to request.referer
end

def unfollow
  current_user.unfollow(params[:id])
  redirect_to request.referer
end

def follower_index
  @user = current_user
  @book = Book.new
end

def follower_index
  @user = current_user
  @book = Book.new
end

end
