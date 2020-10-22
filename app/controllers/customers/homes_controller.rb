class Customers::HomesController < ApplicationController
	def top
		@people = Person.all.page(params[:page]).per(6)
		@portraits = Portrait.all
		@advertisements = Person.all.select do |person|
			person.portraits.empty?
		end
		@book = Book.all
		@unregistereds = Person.all.select do |person|
			person.books.empty?
		end
	end

	def about

	end

	def how_to_use
	end
end
