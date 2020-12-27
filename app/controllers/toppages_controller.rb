class ToppagesController < ApplicationController
  def index
    if logged_in?
      @camppost = current_user.campposts.build  # form_with 用
      @campposts = Camppost.all.order(id: :desc).page(params[:page]) #
    end
  end
end
