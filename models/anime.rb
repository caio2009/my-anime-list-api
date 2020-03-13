class Anime
	attr_accessor :name, :studio, :index

	def initialize(name=nil, studio=nil, index=nil)
		@name = name
		@studio = studio
		@index = index
	end
end