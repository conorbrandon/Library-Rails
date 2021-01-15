class ReviewsController < ApplicationController
	def new
		@search_type_t = params[:search_type_t]
		@search_type_a = params[:search_type_a]
		@search_type_i = params[:search_type_i]
		@search = params[:search]
		@review = Review.new
	end
	def create
		@book = Book.find(params[:book_id])
		@review = @book.reviews.create(params.require(:review).permit(:reviewer, :body))
		redirect_to book_reviews_path(@book, :search => params[:review][:search], :search_type_t => params[:review][:search_type_t], :search_type_a => params[:review][:search_type_a], :search_type_i => params[:review][:search_type_i])
	end
	def index
		@search_type_t = params[:search_type_t]
		@search_type_a = params[:search_type_a]
		@search_type_i = params[:search_type_i]
		@search = params[:search]
		@book = Book.find(params[:book_id])
		@reviews = @book.reviews
	end
end
