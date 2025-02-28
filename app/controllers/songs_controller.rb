class SongsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @songs = Song.all
    @tags = Tag.all
    if params[:search] == nil
      @songs = Song.all
    elsif params[:search] == ''
      @songs = Song.all
    else
      @songs = Song.where("title LIKE ? ",'%' + params[:search] + '%').or(Song.where("artist LIKE ? ", "%" + params[:search] + "%")).or(Song.where("content LIKE ? ", "%" + params[:search] + "%"))
    end

    if params[:tag_ids]
      @songs = []
      params[:tag_ids].each do |key, value|      
        @songs += Tag.find_by(name: key).songs if value == "1"
      end
      @songs.uniq!
    end
  end
    
  def new 
    @song = Song.new
  end

  def create
    song = Song.new(song_params)
    song.user_id = current_user.id
    if song.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show 
    @song = Song.find(params[:id])
    @comments = @song.comments
    @comment = Comment.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    song = Song.find(params[:id])
    if song.update(song_params)
      redirect_to :action =>"show", :id => song.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to action: :index
  end

  private
  def song_params
    params.require(:song).permit(:title,:artist,:content,{:tag_ids => []})
  end

end
