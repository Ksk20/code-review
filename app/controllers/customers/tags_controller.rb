class Customers::TagsController < ApplicationController
before_action :authenticate_customer!


	def destroy
		tag = Tag.find(params[:id])
		tag.destroy
		redirect_to edit_person_book_path(params[:person_id],params[:book_id])
    end
end
