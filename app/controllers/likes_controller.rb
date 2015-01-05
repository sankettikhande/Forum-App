class LikesController < ApplicationController

  def create
   Like.create(:likeable_type=>params[:resource_name], :likeable_id=>params[:resource_id],:user_id=>current_user.id)    
    redirect_to :back, :notice => "success!!!"
  end

  def destroy
    target = Like.where(:likeable_type=>params[:resource_name], :likeable_id=>params[:resource_id],:user_id=>current_user.id).first
    if target
      target.destroy
    end
    redirect_to :back, :notice => "success!!!"

  end
end