require 'sinatra/assetpack'
class Psdfonts < Sinatra::Application

	get '/' do
		erb :index
	end

	post '/results' do

		isPsd = params[:psd]

		if isPsd.nil?
			@uploadedFile = params[:dropbox_file]
		else
			@uploadedFile = params[:psd]
		end

		if @uploadedFile.empty?
			redirect '/'
		else
			Tempfile.open(['psd', '.psd']) do |file|

				if isPsd.nil?
					file.write(open(@uploadedFile).read)
				else
					file.write(@uploadedFile[:tempfile].read)
				end
				@tmpPath = file.path
			end

			psd = PSD.new(@tmpPath)
			psd.parse!
			psdHash = psd.tree.to_hash

			@singleFonts = 
				key_occurences(psdHash, :font).flatten!.map do
				 |x| x[:name].gsub(/-/, ' - ').gsub(/(?<=[a-z])(?=[A-Z])/, ' ') 
				end.uniq 

			erb :results
		end
	end

	not_found do
  	erb :fourohfour
	end

end