class Customers::CreationsController < ApplicationController

	def new
		@creation = Creation.new
	end

	def index
		@creation = Creation.all
	end

	def create
		person = Person.find_by(params[:id])
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
		@creattion = Creation.find(params[:id])
	end

	def update
		@creation = Createtion.find(params[:id])
		if  @creation.update(bookcreation_params)
			flash[:notice] = "作品情報が更新されました"
			redirect_to person_path(@person.id)
		else
    	  render :edit
    	end
	end

	def destroy
		person = Person.find(params[:id])
		creation = Creation.find(params[:id])
  		creation.destroy
  			redirect_to person_path(person.id)

    end
private

  def creation_params
	params.require(:creation).permit(:customer_id, :person_id, :image, :cartoon, :caption)
  end

end
