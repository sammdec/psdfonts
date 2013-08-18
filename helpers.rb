helpers do
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

	def purchase_link(item)
		return 'http://www.myfonts.com/search/' + item.gsub(/ - /,'-').gsub(/ /, '+') + '/fonts/'
	end
end