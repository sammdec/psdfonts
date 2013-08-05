class Psdfonts < Sinatra::Application
	get '/' do

		psd = PSD.new('./assets/img/2.psd')
		psd.parse!
		@psdHash = psd.tree.to_hash

		@fontHash = key_occurences(@psdHash, :font)

		singleFonts = 
			key_occurences(@psdHash, :font).map! do |x| 
  			unwrap(x)
			end.compact!.flatten!
		@singleFonts =  singleFonts.map {|x| x[:name]}.uniq


		erb :index
	end

end