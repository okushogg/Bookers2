class RelationshipsController < ApplicationController

def follow
  #current_user.follow(params[:id])
  relation=Relationship.new
  relation.followed_id=params[:id]
  relation.follower_id=current_user.id
  relation.save
  redirect_to request.referer
end

def unfollow
  # current_user.unfollow(params[:id])
  relation=Relationship.find_by(followed_id: params[:id],follower_id: current_user.id) 
  relation.destroy
  redirect_to request.referer
end

def following_index
  @user = User.find(params[:id])
  @users = @user.following_user
  @book = Book.new
end

def followed_index
  @user = User.find(params[:id])
  @users = @user.followed_user
  @book = Book.new
end

end
