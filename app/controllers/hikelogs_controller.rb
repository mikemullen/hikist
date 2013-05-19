class HikelogsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy


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
    @hikelog.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @hikelog = current_user.hikelogs.find_by_id(params[:id])
      redirect_to root_url if @hikelog.nil?
    end
    
end