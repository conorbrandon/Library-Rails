class SearchPatronController < ApplicationController
  def search
  end

  def results
    @books = Book.all
    @results = []
    @search_type_t = params[:search_type_t]
    @search_type_a = params[:search_type_a]
    @search_type_i = params[:search_type_i]
    @search = params[:search]
    if params[:search_type_t] == '0' and params[:search_type_a] == '0' and params[:search_type_i] == '0'
      @results = @books
    end
    if params[:search_type_t] == '1'
      @books.each do |book|
        if book.title.match(/#{@search}/i)
          @results.append(book)
        end
      end
    end
    if params[:search_type_a] == '1'
      @books.each do |book|
        if book.author.match(/#{@search}/i)
          @results.append(book)
        end
      end
    end
    if params[:search_type_i] == '1'
      @books.each do |book|
        if book.isbn.match(/#{@search}/i)
          @results.append(book)
        end
      end
    end
  end
end
