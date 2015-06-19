class VideosController < ApplicationController
  def index
    @videos = Video.ordered
  end

  def show
    @video = Video.find(params[:id])
  end
end
