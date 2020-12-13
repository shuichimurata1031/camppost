class CamppostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @camppost = current_user.campposts.build(camppost_params)
    if @camppost.save
      flash[:success] = '投稿しました。'
      redirect_to root_url
    else
      @campposts = current_user.campposts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @camppost.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def camppost_params
    params.require(:camppost).permit(:content)
  end
    
  def correct_user
    @camppost = current_user.campposts.find_by(id: params[:id])
    unless @camppost
      redirect_to root_url
    end
  end
end
