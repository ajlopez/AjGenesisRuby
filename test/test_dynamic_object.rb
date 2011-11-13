
require 'ajgenesis'
require 'test/unit'

class TestDynamicObject < Test::Unit::TestCase
	def test_initialize
		dynobj = AjGenesis::DynamicObject.new
		assert_not_nil(dynobj)
	end

	def test_get_undefined_value
		dynobj = AjGenesis::DynamicObject.new
		assert_nil(dynobj.foo)
	end

	def test_set_and_get_value
		dynobj = AjGenesis::DynamicObject.new
		dynobj.foo = "bar"
		assert_equal("bar", dynobj.foo)
	end

	def test_set_and_get_values
		dynobj = AjGenesis::DynamicObject.new
		dynobj.firstName = "Adam"
		dynobj.lastName = "Doe"
		assert_equal("Adam", dynobj.firstName)
		assert_equal("Doe", dynobj.lastName)
	end
	
	def test_nil_has_nil_properties
		assert_nil(nil.foo)
		assert_nil(nil.bar)
	end
end

