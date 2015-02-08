class PagesController < ApplicationController
  def home
  	@user = current_user
    if user_signed_in?
  	 @updates = @user.get_voted Novel.includes(:chapters).order("chapters.created_at desc").paginate(page: params[:page], :per_page => 1)
    end
  end
  def popular
  	@updates = Novel.paginate(page: params[:page], :per_page => 1)
  end
  def newest
   	@updates = Novel.includes(:chapters).order("chapters.created_at desc").paginate(page: params[:page], :per_page => 1)
  end
end
