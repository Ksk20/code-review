class Customers::CustomersController < ApplicationController
	before_action :authenticate_customer!, except: [:show]
	before_action :correct_customer, only: [:edit, :update, :destroy]

	def show
		@people =Person.all
		@customer = Customer.find(params[:id])
		@books = @customer.books
		@favorites = Favorite.where(customer_id: @customer.id)
		@like_books = Book.find(@favorites.pluck(:book_id))
		@portraits = @customer.portraits

	end

	def edit
		@customer = current_customer
	end

	def update
	 	@customer = current_customer
      if  @customer.update(customer_params)
     	  redirect_to customer_path(@customer.id)
      else
    	render "edit"
      end
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy
		redirect_to home_path
	end

	def destruction
	end
private
	def customer_params
    	params.require(:customer).permit(:name,:introduction,:image,:back_image,:is_member,:email)
  	end

  	def correct_customer
     customer = Customer.find(params[:id])
     if current_customer != customer
      redirect_to customer_path(current_customer)
     end
    end
end
