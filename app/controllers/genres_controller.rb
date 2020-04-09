class GenresController < ApplicationController
  

# https://sipsandbits.com/2018/10/11/building-complex-forms-with-rails/
  def create
    #logger.debug "..................GENRE CREATE"
    @genre = Genre.new(genres_params)
    #binding.pry
    if @genre.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    # we collect the id of the 'genre' to be deleted with the params
    @genre = Genre.find(params[:id])
    # then we delete this 'genre.id' from the database, and if succesfull (not already used by a book)
    if @genre.destroy
      # we delete it from the view since we have put the attribute 'remote: true' in the view
      respond_to do |format|
        format.js
      end
    #redirect_to root_path
    end
  end

  def APIcreate
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    if @genre.save
      render json: @genre.to_json
    end
      # logger.debug "..............starting API.js.erb"
      # respond_to do |format|
      #   format.js
    
  end

  # def APIdestroy
  #   @genre = Genre.find(params[:id])
  #   @genre.destroy
  # end

  # def genresJson
  #   genres = Genre.all
  #   render json: genres
  # end

private
  def genre_params
    params.require(:genre).permit(:name)
  end
end


