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

			singleFonts = 
				key_occurences(psdHash, :font).map! do |x| 
	  			unwrap(x)
				end.compact!.flatten!

			@singleFonts =  singleFonts.map {|x| x[:name]}.uniq

			erb :results
		end

		
	end

end