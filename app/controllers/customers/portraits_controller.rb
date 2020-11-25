class Customers::PortraitsController < ApplicationController
	before_action :authenticate_customer!

	def index
		@portraits = Portrait.all
		@person = Person.new
	end
	def create
		@person = Person.find(params[:person_id])
		@portrait =Portrait.new(portrait_params)
		@portrait[:person_id] = @person.id
		@portrait[:customer_id] = current_customer.id
	  if @portrait.save
	     flash[:notice] = "肖像画が登録されました."
	     redirect_to person_path(@person.id)
	  else
	     redirect_to person_path(@person.id)
	  end
	end

	def destroy
		portrait = Portrait.find(params[:id])
  		portrait.destroy
  			redirect_to customer_path(current_customer.id)

	end

private
	def portrait_params
	  params.require(:portrait).permit(:customer_id, :person_id, :image)
 	end

end
