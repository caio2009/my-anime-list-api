require "./google/spreadsheet"

class AnimeService

	@worksheet

	def initialize
		@worksheet = SpreadSheet.get_instance.worksheets[0]
	end

	def find_all
		animes = []

		index = 1
		@worksheet.rows.each do |row|
			animes.push(Anime.new(row[0], row[1], index))
			index += 1
		end

		animes.shift
		return animes
	end

	def find_by_name(name)
		animes = find_all

		filtered_anime = animes.select { |anime| anime.name.downcase.include?(name) }

		return filtered_anime
	end

	def find_by_studio(studio)
		animes = find_all

		filtered_anime = animes.select { |anime| anime.studio.downcase.include?(studio) }

		return filtered_anime
	end

	def create(params)
		@worksheet.insert_rows(@worksheet.num_rows + 1, [[params[:name], params[:studio]]])
		@worksheet.save
	end

	def update(params)
		@worksheet.update_cells(params[:index].to_i, 1, [[params[:name], params[:studio]]])
		@worksheet.save
	end

	def delete(index)
		@worksheet.delete_rows(index, 1)
		@worksheet.save
	end

end