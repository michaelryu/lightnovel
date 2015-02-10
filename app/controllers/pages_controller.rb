class PagesController < ApplicationController
  def home
    @unovel=  Novel.includes(:chapters).order("chapters.created_at desc") 
    if user_signed_in?
  	 @updated = current_user.get_voted Novel.includes(:chapters).reorder("chapters.created_at desc").paginate(page: params[:page], :per_page => 8)
    end
  end
  def popular
  	@popular = Novel.paginate(page: params[:page], :per_page => 8)
  end
  def newest
   	@latest = Novel.includes(:chapters).reorder("chapters.created_at desc").paginate(page: params[:page], :per_page => 8)
  end
end
