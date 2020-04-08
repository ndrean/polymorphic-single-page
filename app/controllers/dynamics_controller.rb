class DynamicsController < ApplicationController

    def new
        logger.debug "........................DYN new"
        @author = Author.new
        @book = @author.books.build
        @genres = Genre.all 
        @genre = Genre.new
        #@book.genre = @genre
    end

    def create
        @author = Author.new(dyn_params)
        @author.books.each { |book| book.genre = Genre.first}
        logger.debug ".............................DYN create"
        if @author.save
            redirect_to root_path, notice: "Success"
        else
            redirect_to new_dynamic_path, notice: "Not saved"
        end
    end


    private

    def dyn_params
        params.require(:author).permit(:name,  :country_id,  :author_id, books_attributes:  [:id, :title, :genre_id, :_destroy])
    end   
end
