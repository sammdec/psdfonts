class Psdfonts < Sinatra::Application
	#set :environment, :production
	register Sinatra::AssetPack
  assets {
  	serve '/js', from: 'assets/js'
	 	serve '/css', from: 'assets/css'
	 	serve '/img', from: 'assets/img'

    js :application, [
    	'/js/ZeroClipboard.js',
    	'/js/main.js'
    ]

    css :application, ['/css/*.css'] 

    css_compression :sass
  }

	get '/' do
		erb :index
	end

	post '/results' do

		uploadedFile = params[:dropbox_file]
			
		if uploadedFile.empty?
			redirect '/'
		else
			tempFile = Tempfile.new(['psd', '.psd'])
			tempFile.write(open(uploadedFile).read)
			tempPath = tempFile.path
			
			psd = PSD.new(tempPath)
			psd.parse!
			psdHash = psd.tree.to_hash
			@singleFonts =
			key_occurences(psdHash, :font).flatten!.map do |x|
				x[:name].gsub(/-/, ' - ').gsub(/(?<=[a-z])(?=[A-Z])/, ' ') 
			end.uniq

			tempFile.close!
			erb :results
		end
	end

	not_found do
  	erb :fourohfour
	end

end