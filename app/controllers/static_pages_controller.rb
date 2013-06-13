class StaticPagesController < ApplicationController
  
  def home
  	if signed_in?
  	  @hikelog    = current_user.hikelogs.build
  	  @feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end

end
