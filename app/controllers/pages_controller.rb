class PagesController < ApplicationController
  def home
  	@user = current_user
    @unovel=  Novel.includes(:chapters).order("chapters.created_at desc") 
    if user_signed_in?
  	 @updated = @user.get_voted Novel.includes(:chapters).order("chapters.created_at desc").paginate(page: params[:page], :per_page => 12)
    end
  end
  def popular
  	@updates = Novel.paginate(page: params[:page], :per_page => 12)
  end
  def newest
   	@updates = Novel.includes(:chapters).order("chapters.created_at desc").paginate(page: params[:page], :per_page => 12)
  end
end
