
module AjGenesis

class DynamicObject
	def initialize
		@values = {}
	end
	
	def method_missing(*args)
		if args.length == 1
			@values[args[0]]
		elsif args.length == 2 and args[0].to_s =~ /^(.*)=$/
			@values[$1.intern] = args[1]
		else
			super
		end
    end	
end

end

