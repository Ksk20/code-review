class Customers::BooksController < ApplicationController
	before_action :authenticate_customer!
	before_action :correct_customer, only: [:edit, :update, :destroy]

	def new
		@book = Book.new

	end

	def index
	end

	def create
		@person = Person.find_by(params[:id])
    	@book = Book.new(book_params)
    	@book[:person_id] = @person.id
    	@book[:customer_id] = current_customer.id
    	if @book.save
    	   redirect_to person_path(@person.id)
    	else
    		render :new
    	end
  	end

	def edit
	end
	def update
	end

	def destroy
	end

private
	def book_params
    	params.require(:book).permit(:title,:caption,:image_url,:person_id,:customer_id)
  	end

  	def correct_customer
     customer = Customer.find(params[:id])
     if current_customer != customer
      redirect_to customer_path(current_custome)
     end
    end
end
