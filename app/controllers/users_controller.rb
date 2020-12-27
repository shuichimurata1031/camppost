class UsersController < ApplicationController
    before_action :require_user_logged_in, only: [:index, :show]  #ApplicationController を継承
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end
#users#index では、User.order(id: :desc) で id の降順にユーザの一覧を取得しています。
#また、ページネーションを適用させるために .page(params[:page]) を付けています。
#さらに、per(25)、最大で25件取得できます。

  def show
    @user = User.find(params[:id])
    @campposts = @user.campposts.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      #処理を users#show のアクションへと強制的に移動させる。更に show アクションが実行され、show.html.erb が呼ばれる。
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def likes
    @user = User.find(params[:id])
    @campposts = @user.favorite_campposts.page(params[:page])
    counts(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end