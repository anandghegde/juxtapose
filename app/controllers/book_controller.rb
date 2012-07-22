
class BookController < ApplicationController

    respond_to :html
    respond_to :json, :only => :view
    layout 'application'
	def index
        @fiction_books={"9781444740141"=>{:author=>"John Grisham", :title=>"The Litigators"}, "9788129118776"=>{:author=>"Ravi Subramanian", :title=>"The Incredible Banker"}, "9780143066156"=>{:author=>"Amitav Ghosh", :title=>"Sea Of Poppies"}, "9780857389954"=>{:author=>"Stiegg Larsson", :title=>"The Girl With The Dragon Tattoo"}, "9781447213383"=>{:author=>"David Baldacci", :title=>"Zero Day"}, "9788129118806"=>{:author=>"Chetan Bhagat", :title=>"Revolution 2020"}, "9788188575701"=>{:author=>"Ravinder Singh", :title=>"I too had a Love Story"}, "9789380658742"=>{:author=>"Amish Tripathi", :title=>"Immortals of Meluha"}, "9788172238476"=>{:author=>"Aravind Adiga", :title=>"The White Tiger"}, "9789380658797"=>{:author=>"Amish Tripathi", :title=>"The Secret Of the Nagas"}}
        @non_fiction_books={"9781408703748"=>{:author=>"Walter Isaacson", :title=>"Steve Jobs"}, "9781416502494"=>{:author=>"Stephen Covey", :title=>"7 Habits of Highly Effective People"}, "9780007428052"=>{:author=>"Siddhartha Mukherjee", :title=>"The Emperor of all Maladies"}, "9788179921623"=>{:author=>"Robin Sharma", :title=>"The Monk Who Sold His Ferrari"}, "9788184001051"=>{:author=>"Rujuta Diwekar", :title=>"Don't Lose Your Mind Lose Your Weight"}, "9788190453011"=>{:author=>"Rashmi Bansal", :title=>"Stay Hungry Stay Foolish"}, "9788190779517"=>{:author=>"CNBC", :title=>"108 Mantras for Financial Success"}, "9789325956612"=>{:author=>"Ankit Fadia", :title=>"How to Unlock everything on the Internet"}, "9789380658384"=>{:author=>"Rashmi Bansal", :title=>"I Have a Dream"}, "9789380658636"=>{:author=>"Devdutt Pattanaik", :title=>"7 Secrets Of Pattanaik"}}
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
