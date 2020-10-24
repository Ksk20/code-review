class Admins::PeopleController < ApplicationController
	before_action :authenticate_admin!
	def index
		@people = Person.all
		#@people = Person.all.order(:name)

	end

	def destroy

		Person.find(params[:id]).destroy
		redirect_to admins_people_path
	end

  private
  def person_params
    params.person(:person).permit(:name, :name_kana, :alias)
  end
end
