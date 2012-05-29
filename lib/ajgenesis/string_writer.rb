
module AjGenesis

  class StringWriter
    attr_reader :result
    
    def initialize
      @result = ""
    end

    def write(text)
      @result += text
    end
  end

end