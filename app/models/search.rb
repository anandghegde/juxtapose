class Search
	attr_accessor :search_key, :result

	def initialize(search_key)
		@search_key=search_key
	end

	def do_search()
		return GoogleBooks.search(@search_key, {:count => 10})
	end

	def get_book_details()
		@search_item=GoogleBooks.search(@search_key)
		@book_title=@search_item.first.title
		@book_author=@search_item.first.authors
		@book_img_url=@search_item.first.image_link(:zoom=>5)
		return @book_title,@book_author,@book_img_url
	end
end
