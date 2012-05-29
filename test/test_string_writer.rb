
require 'ajgenesis'
require 'test/unit'

module AjGenesis
  class TestStringWriter < Test::Unit::TestCase
    def test_write_string
      writer = StringWriter.new
      
      writer.write("foo")
      assert_equal("foo", writer.result)
    end

    def test_write_number
      writer = StringWriter.new
      
      writer.write(3)
      assert_equal("3", writer.result)
    end
  end
end

