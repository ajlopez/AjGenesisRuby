
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
    
    def test_make_from_simple_hash
      dynobj = AjGenesis::DynamicObject.make_from_hash({ 'firstName' => 'Adam', 'lastName' => 'Doe' })
      assert_not_nil(dynobj)
      assert(dynobj.is_a? AjGenesis::DynamicObject)
      assert_equal('Doe', dynobj.lastName)
      assert_equal('Adam', dynobj.firstName)
    end
    
    def test_make_from_nested_hash
      dynobj = AjGenesis::DynamicObject.make_from_hash({ 'firstName' => 'Adam', 'lastName' => 'Doe',
        'wife' => { 'firstName' => 'Eve', 'lastName' => 'Doe' }
      })
      assert_not_nil(dynobj)
      assert(dynobj.is_a? AjGenesis::DynamicObject)
      assert_equal('Doe', dynobj.lastName)
      assert_equal('Adam', dynobj.firstName)
      assert_not_nil(dynobj.wife)
      assert_equal('Eve', dynobj.wife.firstName)
      assert_equal('Doe', dynobj.wife.lastName)
    end
    
    def test_make_from_hash_with_simple_array
      dynobj = AjGenesis::DynamicObject.make_from_hash({ 'firstName' => 'Adam', 'lastName' => 'Doe', 'data' => [1,2,3] })
      assert_not_nil(dynobj)
      assert(dynobj.is_a? AjGenesis::DynamicObject)
      assert_equal('Doe', dynobj.lastName)
      assert_equal('Adam', dynobj.firstName)
      assert_equal([1,2,3], dynobj.data)
    end
    
    def test_make_from_hash_with_array
      dynobj = AjGenesis::DynamicObject.make_from_hash({ 'firstName' => 'Adam', 'lastName' => 'Doe', 
        'sons' => [
          {'name' => 'Cain'},
          {'name' => 'Abel'}
        ] })
      assert_not_nil(dynobj)
      assert(dynobj.is_a? AjGenesis::DynamicObject)
      assert_equal('Doe', dynobj.lastName)
      assert_equal('Adam', dynobj.firstName)
      assert_equal('Cain', dynobj.sons[0].name)
      assert_equal('Abel', dynobj.sons[1].name)
    end
    
    def test_make_from_simple_string
      dynobj = AjGenesis::DynamicObject.make_from_string('{ "firstName": "Adam", "lastName": "Doe" }')
      assert(dynobj.is_a? AjGenesis::DynamicObject)
      assert_equal('Doe', dynobj.lastName)
      assert_equal('Adam', dynobj.firstName)
    end
    def test_make_from_nested_string
      dynobj = AjGenesis::DynamicObject.make_from_string('{ "firstName": "Adam", "lastName": "Doe", "sons": [ { "name": "Cain" }, {"name": "Abel"} ]}')
      assert(dynobj.is_a? AjGenesis::DynamicObject)
      assert_equal('Doe', dynobj.lastName)
      assert_equal('Adam', dynobj.firstName)
      assert_equal('Cain', dynobj.sons[0].name)
      assert_equal('Abel', dynobj.sons[1].name)
    end
end

