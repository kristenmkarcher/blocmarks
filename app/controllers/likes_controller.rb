class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = " You have successfully liked the bookmark."
    else
      flash.now[:alert] = "There was an error liking the bookmark. Please try again."
    end
    redirect_to @bookmark.topic
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = " You have successfully unliked the bookmark."
    else
      flash.now[:alert] = "There was an error unliking the bookmark. Please try again."
    end
    redirect_to @bookmark.topic
  end
end
