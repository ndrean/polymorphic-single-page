class GenresController < ApplicationController
  
# https://sipsandbits.com/2018/10/11/building-complex-forms-with-rails/
  def create
    @genre = Genre.new(genres_params)
    if @genre.save
      respond_to do |format|
        format.js
      end
    end
    
  end

private
  def genres_params
    params.require(:genre).permit(:name)
  end
end
