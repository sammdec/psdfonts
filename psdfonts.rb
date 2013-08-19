class Psdfonts < Sinatra::Application
	get '/' do
		erb :index
	end

	post '/' do
		@uploadedFile = params[:psd]
		if @uploadedFile.nil?
			erb :index
		else
			Tempfile.open(['psd', '.psd']) do |file|
				file.write(@uploadedFile[:tempfile].read)
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

end