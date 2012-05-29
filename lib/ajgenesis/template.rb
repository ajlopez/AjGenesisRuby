
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
      return "writer.write(" + text.dump + ")\n";
    end
  end

end