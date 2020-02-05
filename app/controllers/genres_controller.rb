class GenresController < ApplicationController
  

  def create
    @genre = Genre.new(genres_params)
    if @genre.save
      respond_to do |format|
        format.js
      end
    end
    
  end

  def genres_params
    params.require(:genre).permit(:name)
  end
end
