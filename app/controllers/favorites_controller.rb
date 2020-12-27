class FavoritesController < ApplicationController
  before_action :require_user_logged_in
    
  def create
    camppost = Camppost.find(params[:camppost_id])
    current_user.favorite(camppost)
    flash[:success] = '投稿をお気に入りしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    camppost = Camppost.find(params[:camppost_id])
    current_user.unfavorite(camppost)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
end