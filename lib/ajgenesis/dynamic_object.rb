
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
    
    def self.make_from_hash(hash)
      obj = DynamicObject.new
      
      hash.each { |key, value |
        if value.is_a? Hash
          value = make_from_hash(value)
        elsif value.is_a? Array
          value = make_array(value)
        end
        
        obj.set_value(key.intern, value)
      }
      
      return obj
    end
    
    def self.make_array(array)
      value = []
      
      array.each {|element|
        if element.is_a? Hash
          value.push(make_from_hash(element))
        elsif element.is_a? Array
          value.push(make_array(element))
        else
          value.push(element)
        end
      }
      
      return value
    end
    
    def set_value(name, value)
      if (name.is_a? Symbol)
        @values[name] = value
      else
        @values[name.intern] = value
      end
    end
    
    def get_value(name)
      if (name.is_a? Symbol)
        return @values[name]
      else
        return @values[name.intern]
      end
    end
  end

end

