class Psdfonts < Sinatra::Application
	get '/' do

		psd = PSD.new('./assets/img/2.psd')
		psd.parse!
		@psdparsed = psd.tree.descendant_layers.first.to_hash

		@psdHash = @psdparsed

		@individualKey = @psdHash.select { |key| }


		erb :index
	end
end