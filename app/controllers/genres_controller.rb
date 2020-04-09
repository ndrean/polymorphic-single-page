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

  def APIdestroy
   # map.connect 'APIdestroy/:id', controller:'genres', action:'APIdestroy'
    # we collect the id of the 'genre' to be deleted with the params
    @genre = Genre.find(params[:id])
    logger.debug "...................................FETCH.. #{@genre.name} #{@genre.id}"
    # then we delete this 'genre.id' from the database, and if succesfull (not already used by a book)
   @genre.destroy
    head :no_content
      # we delete it from the view since we have put the attribute 'remote: true' in the view
      # respond_to do |format|
      #   format.js
      # end
    #redirect_to root_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy # if removed from database, then remove from view with the JS
      logger.debug "................................................... #{@genre.name} #{@genre.id}"
      respond_to do |format|
        format.js
      end
    end
  end

  def APIcreate
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    if @genre.save
      render json: @genre.to_json
    end
  end


  # def genresJson
  #   genres = Genre.all
  #   render json: genres
  # end

private
  def genre_params
    params.require(:genre).permit(:name)
  end
end


