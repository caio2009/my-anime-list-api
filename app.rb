require "./models/anime"

require "./services/anime-service"

require "sinatra"
require "oj"
require "json"


class App < Sinatra::Base

	get "/" do
		"Hello World"
	end

	# Anime Endpoints ##########################################################################################
	get "/animes" do
		content_type :json

		service = AnimeService.new
		animes = service.find_all

		Oj.dump animes, :indent => 2, :mode => :custom
	end

	get "/animes/name/:name" do
		content_type :json

		service = AnimeService.new
		animes = service.find_by_name(params[:name])
		
		Oj.dump animes, :indent => 2, :mode => :custom
	end

	get "/animes/studio/:studio" do
		content_type :json

		service = AnimeService.new
		animes = service.find_by_studio(params[:studio])

		Oj.dump animes, :indent => 2, :mode => :custom
	end

	post "/animes" do
		service = AnimeService.new
		service.create(params)
	end

	put "/animes/:index" do
		service = AnimeService.new
		service.update(params)
	end

	delete "/animes/:index" do
		service = AnimeService.new
		service.delete(params[:index].to_i)
	end
	############################################################################################################

end