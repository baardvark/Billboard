class SongsController < ApplicationController
  
    before_action :set_song, only: [:show, :edit, :update, :destroy]
    before_action :set_artist
  
    def index
      @songs = Song.all
    end
  
    def show
    end
  
    def new 
      @song = Song.new
    end
  
    def create
      @song = @artist.songs.new(song_params)
      if @song.save
        redirect_to boards_songs_path(@artist.board_id, @artist)
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update 
      if @song.update(song_params)
        redirect_to boards_songs_path
      else 
        render :edit
      end
    end
  
    def destroy
      @song.destroy
      redirect_to boards_songs_path
    end
  
    private
      def set_song
        @song = Song.find(params[:id])
      end

      def set_artist
        @artist = Artist.find(params[:id])
      end
  
      def song_params
        params.require(:song).permit(:title, :album)
      end
  end