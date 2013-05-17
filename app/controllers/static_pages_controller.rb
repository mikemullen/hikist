class StaticPagesController < ApplicationController
  def home
  	@hikelog = current_user.hikelogs.build if signed_in?
  end

  def help
  end

  def about
  end
end
