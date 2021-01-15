class BooksController < ApplicationController
	def new
		@book = Book.new
	end
	def show
		@search_type_t = params[:search_type_t]
		@search_type_a = params[:search_type_a]
		@search_type_i = params[:search_type_i]
		@search = params[:search]
		@book = Book.find(params[:id])
	end
	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to books_path
		else
			render 'new'
		end
	end
	def index
		@books = Book.all
	end
	def edit
		@search_type_t = params[:search_type_t]
		@search_type_a = params[:search_type_a]
		@search_type_i = params[:search_type_i]
		@search = params[:search]
		@id = params[:id]
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			#redirect_to @book
			#render plain: params[:book][:search].inspect
			#redirect_to(book_path(:search => params[:book][:search], :search_type_t => params[:book][:search_type_t], :search_type_a => params[:book][:search_type_a], :search_type_i => params[:book][:search_type_i]))
			redirect_to(search_res_search_path)
			
		else
			render 'edit' 
		end
	end
	def destroy
		@book = Book.find(params[:id]) 
		@book.destroy
		redirect_to books_path 
	end
	
	private
	def book_params
		params.require(:book).permit(:title, :author, :isbn, :copies)
	end
end
