class HikelogsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :new, :edit, :update]
  before_filter :correct_user,   only: [:destroy, :edit, :update]

  def new
    @hikelog = current_user.hikelogs.new
  end

  def edit
  end

  def update
    if @hikelog.update_attributes(params[:hikelog])
      flash[:success] = "Hikelog updated"
      redirect_to @hikelog
    else
      render 'edit'
    end
  end

  def show
    @hikelog = Hikelog.find_by_id(params[:id])
  end

  def create
  	@hikelog = current_user.hikelogs.build(params[:hikelog])
  	if @hikelog.save
  	  flash[:success] = "Hike added!"
  	  redirect_to root_url
  	else
      @feed_itmes = []
      render 'hikelogs/new'
  	  #render 'static_pages/home'
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