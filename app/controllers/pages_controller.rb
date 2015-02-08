class PagesController < ApplicationController
  def home
  	@user = current_user
  end
  def popular
  	@updates = Novel.all
  end
  def newest 
  end
end
