class VideosController < ApplicationController
  def index
    @videos = Video.ordered
  end
end
