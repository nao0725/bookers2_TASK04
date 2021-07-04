class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:relationship][:follow_id])
    following = current_user.follow(@user)
    following.save
  end

  def destroy
    @user = User.find(params[:relationship][:follow_id])
    following = current_user.unfollow(@user)
    following.destroy
  end

  def index
    
  end
end

