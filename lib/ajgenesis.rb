
require 'ajgenesis/dynamic_object.rb'

module AjGenesis

end

class NilClass
	def method_missing(*args)
		if args.length == 1
			return self
		else
			super
		end
	end
end

