
require 'ajgenesis'
require 'test/unit'

class TestStringWriter < Test::Unit::TestCase
    def test_write_string
		writer = AjGenesis::StringWriter.new
		writer.write("foo")
		assert_equal("foo", writer.result)
    end
end

