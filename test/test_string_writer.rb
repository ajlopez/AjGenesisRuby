
require 'ajgenesis'
require 'test/unit'

module AjGenesis
  class TestStringWriter < Test::Unit::TestCase
    def test_write_string
      writer = StringWriter.new
      
      writer.write("foo")
      assert_equal("foo", writer.result)
    end
  end
end

