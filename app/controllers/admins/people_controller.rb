class Admins::PeopleController < ApplicationController
	def index
		@people = Person.all

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
