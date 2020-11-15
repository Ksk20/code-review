class Customers::BooksController < ApplicationController
	before_action :authenticate_customer!
  before_action :correct_customer, only: [:edit, :update, :destroy]

	def new
    @person = Person.find(params[:person_id])
		@book = Book.new
      respond_to do |format|
        format.html
        format.json
      end

	end

	def index
	end

	def create
		person = Person.find(params[:person_id])
    	@book = Book.new(book_params)
    	@book[:person_id] = person.id
    	@book[:customer_id] = current_customer.id
    	if @book.save
    	   redirect_to person_path(person.id)
    	else
    		render :new
    	end
  	end

  def edit
    @book = Book.find(params[:id])
    @person = Person.find(@book.person_id)
  end

  def update
    @book = Book.find(params[:id])
    @book[:customer_id] = current_customer.id
      if @book.update(book_params)
         redirect_to person_path(params[:person_id])
      else
           render "edit"
      end
  end
	def destroy
     @book = Book.find(params[:id])
     @book.destroy
     if params[:customer_id].present?
      @customer = Customer.find(params[:customer_id])
      redirect_to @customer
      return
     else
      redirect_to person_path(params[:person_id])
      return
     end
	end

private
	def book_params
    	params.require(:book).permit(:title,:caption,:image_url,:person_id,:customer_id,:grade)
  	end
  def correct_customer
   @book = current_customer.books.find_by(id: params[:id])
    unless @book
      redirect_to home_path
    end
  end

end
