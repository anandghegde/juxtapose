
class BookController < ApplicationController

    respond_to :html
    respond_to :json, :only => :view
    layout 'application'
	def index
        @fiction_books=KueStore[:fiction]
        @non_fiction_books=KueStore[:non_fiction]
        @latest_books=KueStore[:fiction].merge(KueStore[:non_fiction])
        latest_books_array=@latest_books.keys.sort_by{rand}[0..9]
        latest_books_array.each do |isbn|
            @latest_books.delete(isbn) 
        end
	end

	def view
		@isbn = canonicalize_isbn(params[:isbn])
		@prices = Bookprice.new(:isbn => @isbn).perform
		@book_title, @book_author, @book_img_url=Search.new(@isbn).get_book_details
	end

	def search
		@search_key=params[:title]
		@title=Search.new(params[:title])
		@result= @title.do_search
		return @result
	end


	def canonicalize_isbn(text)
	   unless text.nil?
	     text.to_s.gsub('-', '').upcase
	   end
	end

	def is_isbn10(text)
	   /^[0-9]{9}[0-9xx]$/.match(text)
	end

	def is_isbn13(text)
	   /^[0-9]{13}$/.match(text)
	end


end
