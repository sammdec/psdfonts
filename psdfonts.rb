class Psdfonts < Sinatra::Application
	get '/' do

		psd = PSD.new('./assets/img/2.psd')
		psd.parse!
		@psdHash = psd.tree.to_hash


		erb :index
	end
end