class Psdfonts < Sinatra::Application
	get '/' do
		erb :index
	end

	post '/' do
		Tempfile.open(['psd', '.psd']) do |psd|
			psd.write(params[:psd][:tempfile].read)
			@tmpPath = psd.path
		end

		psd = PSD.new(@tmpPath)
		psd.parse!
		psdHash = psd.tree.to_hash

		singleFonts = 
			key_occurences(psdHash, :font).map! do |x| 
  			unwrap(x)
			end.compact!.flatten!
		@singleFonts =  singleFonts.map {|x| x[:name]}.uniq
		


		erb :index
	end

end