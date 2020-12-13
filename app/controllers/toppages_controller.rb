class ToppagesController < ApplicationController
  def index
    if logged_in?
      @camppost = current_user.campposts.build  # form_with 用
      @campposts = current_user.campposts.order(id: :desc).page(params[:page])
    end
  end
end
