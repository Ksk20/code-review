class Customers::PeopleController < ApplicationController
	before_action :authenticate_customer!, except: [:show, :index]
	def new
	  @person = Person.new
	end

	def index
	  @people = Person.all
	end

	def show
		@person = Person.find(params[:id])
		@books = @person.books
		@portraits = @person.portraits
		@portrait =Portrait.new(@portraits_params)
		@portrait.customer_id = current_customer.id
	  if @portrait.save
	     flash[:notice] = "肖像画が登録されました."
	     redirect_to person_path(person.id)
	  else
	     render 'customers/people/show'
	  end
	end

	def create
	 	# １. データを新規登録するためのインスタンス作成
    	@person = Person.new(person_params)
    	# ２. データをデータベースに保存するためのsaveメソッド実行
    if	@person.save
    	# ３. 偉人詳細画面へリダイレクト
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
