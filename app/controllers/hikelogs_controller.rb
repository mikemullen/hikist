class HikelogsController < ApplicationController
  before_filter :signed_in_user

  def create
  	@hikelog = current_user.hikelogs.build(params[:hikelog])
  	if @hikelog.save
  	  flash[:success] = "Hike added!"
  	  redirect_to root_url
  	else
      @feed_itmes = []
  	  render 'static_pages/home'
  	end
  end

  def destroy
  end
end