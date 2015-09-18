class VideosController < ApplicationController
  before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :set_video, only: [:edit, :update, :destroy]

  def index
    @videos = Video.ordered
  end

  def show
    @video = Video.find(params[:id])
  end

  def edit; end

  def new
    @video = current_user.videos.new
  end

  def create
    @video = current_user.videos.new(video_params)
    if @video.save
      redirect_to video_url(@video), notice: 'Thanks for the video!'
    else
      render :edit
    end
  end

  def update
    if @video.update_attributes(video_params)
      redirect_to video_url(@video), notice: 'Your video is updated!'
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to root_url, notice: 'Yeah, fuck that video!'
  end

  private

  def set_video
    @video = current_user.videos.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:youtube_id, :title, :description, :published_at)
  end
end
