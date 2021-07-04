class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:follow_id])
    @following = current_user.follow(@user)
    @following.save
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    following.destroy
    redirect_to users_path
  end


  def follow_users
    @user = User.find(params[:follow_id])
    @users = User.followings
  end

  def follower_users
    @user = User.find(params[:followed_id])
    @users = User.followers
  end

end

