class Psdfonts < Sinatra::Application
	#set :environment, :production

	get '/' do
		erb :index
	end

	post '/results' do
		uploadedFile = params[:dropbox_file]

		if !uploadedFile.empty?
			tempFile = Tempfile.new(['psd', '.psd'])
			tempFile.write open(uploadedFile).read
			tempPath = tempFile.path

			psd = PSD.new(tempPath)
			psd.parse!
			psdHash = psd.tree.to_hash
			@singleFonts = key_occurences(psdHash, :font).flatten!.map do |x|
				x[:name].gsub(/-/, ' - ').gsub(/(?<=[a-z])(?=[A-Z])/, ' ')
			end.uniq

			tempFile.close!
			erb :results
		else
			redirect '/'
		end
	end

	not_found do
  	erb :fourohfour
	end

	error do
		@error = request.env['sinatra_error']
		erb :fiveohoh
	end

end