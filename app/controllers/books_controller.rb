class BooksController < ApplicationController
    def index
        @book = Book.all
    end
end