
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
    
    def self.makeFromHash(hash)
        obj = DynamicObject.new
        
        hash.each { |key, value |
            if value.is_a? Hash
                value = makeFromHash(value)
            end
            
            obj.setValue(key.intern, value)
        }
        
        return obj
    end
    
    def setValue(name, value)
        if (name.is_a? Symbol)
            @values[name] = value
        else
            @values[name.intern] = value
        end
    end
    
    def getValue(name)
        if (name.is_a? Symbol)
            return @values[name]
        else
            return @values[name.intern]
        end
    end
end

end


