class Customers::CreationsController < ApplicationController

	def new
		@creation = Creation.new
	end

	def index
		@creation = Creation.all
	end

	def create
		@creation = Creation.new(creation_params)
		@person = Person.find(params[:id])
		if @creation.save
			flash[:notice] = "作品が登録されました"
			redirect_back fallback_location: root_url
			#redirect_to person_path(@person.id)
		else
    	   ender 'customers/people/show'
	end

	def edit
		@creattion = Creation.find(params[:id])
	end

	def update
		@creation = Createtion.find(params[:id])
		if  @creation.update(bookcreation_params)
			flash[:notice] = "作品情報が更新されました"
			#redirect_to person_path(@person.id)
		else
    	  render :　'customers/people/show'
    	end
	end

	def destroy
		  	@creation = Createtion.find(params[:id])
  			creation.destroy
  			redirect_to fallback_location: root_url

private

  def creation_params
	params.require(:creation).permit(:customer_id, :person_id, :image_id, :cartoon_id, :caption)
  end

end
