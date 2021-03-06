class Customers::PeopleController < ApplicationController
	before_action :authenticate_customer!, except: [:show, :index]
	def new
	  @person = Person.new
	end

	def index
		@people = Person.order(:name_kana)
	end

	def search
		@people = Person.search(params[:keyword]).order(:name_kana)
		@keyword = params[:keyword]
		render "index"
	end

	def show
		@person = Person.find(params[:id])
		@beginners = @person.books.where(grade: 'beginner').page(params[:page]).per(5)
		@professionals = @person.books.where(grade: 'professional').page(params[:page]).per(5)
		@creations = @person.creations.page(params[:page]).per(10)
		@portrait =Portrait.new
	end

	def create
    	@person = Person.new(person_params)
    	if	@person.save
    		flash[:notice] = "新しく偉人を登録しました！"
    		redirect_to person_path(@person.id)
    	else
    		render action: :new
		end
	end

	def edit
		@person = Person.find(params[:id])
	end

	def update
		@person = Person.find(params[:id])
    	if @person.update(person_params)
    	   redirect_to person_path(@person.id)
    	else
      	   render "edit"
    	end
	end

private
	def person_params
		params.require(:person).permit(:name,:name_kana,:alias,:country,:introduction,:birth,:death,:person_image_id,:customer_id)
	 end
end
