
module AjGenesis

  class Template
    attr_reader :code
    
    def initialize(text)
      @code = Template.compile(text)
    end
    
    def render(model)
      writer = StringWriter.new
      eval(@code)
      return writer.result
    end
    
    def self.compile(text)
      pos = text.index("<#")
      
      if !pos.nil?
        pos2 = text.index("#>", pos)
        result = compileInterpolation(text[0..(pos-1)])
        result += text[(pos+2)..(pos2-1)]
        result += compile(text[(pos2+2)..-1])
        return result
      end
      
      return compileInterpolation(text)
    end
    
    def self.compileInterpolation(text)
      if !text
        return ''
      end
      
      pos = text.index("${")
      if !pos.nil?
        pos2 = text.index("}", pos)
        result = ''
        
        if (pos > 0)
          result = compileInterpolation(text[0..(pos-1)])
        end
          
        result += "writer.write(" + text[(pos+2)..(pos2-1)] + ")\n"
        result += compileInterpolation(text[(pos2+2)..-1])
        return result
      else
        return "writer.write(" + text.dump + ")\n";
      end
    end
  end

end