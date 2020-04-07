class GenresController < ApplicationController
  

# https://sipsandbits.com/2018/10/11/building-complex-forms-with-rails/
  def create
    logger.debug "..................GENRE CREATE"
    @genre = Genre.new(genres_params)
    binding.pry
    if @genre.save
      respond_to do |format|
        format.js
      end
    end

  end

  def APIcreate
    logger.debug "..................API"
    genre = Genre.new(genres_params)
    genres = Genre.all
    if genre.save
      render json: genres.to_json
    end
  end

  def genresJson
    genres = Genre.all
    render json: genres
  end

  def createGenre
  end

private
  def genres_params
    params.require(:genre).permit(:name)
  end
end


