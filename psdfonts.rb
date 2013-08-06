class Psdfonts < Sinatra::Application
	get '/' do

		psd = PSD.new('./assets/img/2.psd')
		psd.parse!
		psdHash = psd.tree.to_hash

		singleFonts = 
			key_occurences(psdHash, :font).map! do |x| 
  			unwrap(x)
			end.compact!.flatten!
		@singleFonts =  singleFonts.map {|x| x[:name]}.uniq

		erb :index
	end

	post '/' do
		@title = params[:title]
		File.open('uploads/'+params[:psd][:filename], 'w') do |psd|
			psd.write(params[:psd][:tempfile].read)
		end
		@fileName = params[:psd]


		erb :index
	end

end