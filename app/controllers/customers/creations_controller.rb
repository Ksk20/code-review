class Customers::CreationsController < ApplicationController
	before_action :authenticate_customer!
	before_action :correct_customer, only: [:edit, :update, :destroy]

	def new
		@creation = Creation.new
		@person = Person.find(params[:person_id])
	end

	def index
		@creation = Creation.all
	end

	def create
		person = Person.find(params[:person_id])
		@creation = Creation.new(creation_params)
		@creation[:person_id] = person.id
		@creation[:customer_id] = current_customer.id
		if @creation.save
			flash[:notice] = "作品が登録されました"
			redirect_to person_path(person.id)
		else
    	   render :new
    	end
	end

	def edit
		@creation = Creation.find(params[:id])
		@person = Person.find(@creation.person_id)
	end

	def update
		@creation = Creation.find(params[:id])
		@creation[:customer_id] = current_customer.id
		if  @creation.update(creation_params)
			flash[:notice] = "作品情報が更新されました"
			redirect_to person_path(params[:person_id])
		else
    	  render "edit"
    	end
	end

	def destroy
		person = Person.find(params[:person_id])
		@creation = Creation.find(params[:id])
  		@creation.destroy
  			redirect_to person_path(person.id)

    end
private

  def creation_params
	params.require(:creation).permit(:customer_id, :person_id, :image, :cartoon, :caption)
  end
   def correct_customer
   @creation = current_customer.creations.find_by(id: params[:id])
    unless @creation
      redirect_to home_path
    end
end
end
