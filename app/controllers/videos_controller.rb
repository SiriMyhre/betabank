class VideosController < ApplicationController
  before_action :set_boulder

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.boulder = @boulder
    @video.save
    redirect_to boulder_path(@boulder)
  end

  private
  def set_boulder
    @boulder = Boulder.find(params[:boulder_id])
  end

  def video_params
    params.require(:video).permit(:link, :position_min, :position_sec)
  end
end
