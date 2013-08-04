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


	def key_occurences(obj, k)

  	# deal with arrays recursively
  	return obj.map {|x| key_occurences(x,k) } if obj.is_a?(Array)

  	# otherwise assume we have a Hash
	  obj.to_a.map do |x|
	    return x[1] if x[0] == k
	    return key_occurences(x[1], k) if x[1].is_a?(Array) || x[1].is_a?(Hash) #recurse again if our key is itself a Hash or Array
	  end.compact
	end

	def unwrap(arr)
  	return arr if arr[0].is_a?(Hash)
  	return nil if arr.is_a?(Array) && arr.size == 0
  	unwrap(arr[0])
	end


end