require "google_drive"

module Session

	def self.get_instance
		session = GoogleDrive::Session.from_service_account_key("client_secret.json")
	end

end