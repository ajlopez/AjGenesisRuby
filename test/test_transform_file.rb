require 'ajgenesis'
require 'test/unit'

module AjGenesis

  class TestTransformFile < Test::Unit::TestCase
    def test_transform_hello
      result = transform_file('hello.tpl', 'hello.txt', nil)
      assert(result.index('Hello, world'))
    end
    
    def test_transform_hello_name
      result = transform_file('hello_name.tpl', 'hello.txt', { :name => "Adam" })
      assert(result.index('Hello, Adam'))
    end
    
    def transform_file(source, target, model)
      source = File.expand_path(source, File.dirname(__FILE__))
      target = File.expand_path(target, File.dirname(__FILE__))
      AjGenesis.transform_file(source, target, model)
      return IO.read(target)
    end
  end
  
end
