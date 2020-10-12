class Customers::PortraitsController < ApplicationController
	def index
		@portraits = Portrait.all
		@person = Person.new
	end
	def create
		@person = Person.new
		@person = Person.find(params[:person_id])
		@portrait =Portrait.new(portrait_params)
		@portrait.customer_id = current_customer.id
	  if @portrait.save
	     flash[:notice] = "肖像画が登録されました."
	     redirect_to person_path(person.id)
	  else
	     render 'customers/people/show'
	  end
	end
	def destroy
	end

private
	def portrait_params
	  params.require(:portrait).permit(:customer_id, :person_id, :image_id)
 	end
end
