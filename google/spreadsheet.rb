require_relative "session"

module SpreadSheet

	def self.get_instance
		Session.get_instance.spreadsheet_by_title("Anime SpreadSheet")
	end

end