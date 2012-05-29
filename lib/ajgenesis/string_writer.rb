
module AjGenesis

  class StringWriter
    attr_reader :result
    
    def initialize
      @result = ""
    end

    def write(text)
      @result += text.to_s
    end
  end

end