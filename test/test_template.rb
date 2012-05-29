
require 'ajgenesis'
require 'test/unit'

module AjGenesis

  class TestTemplate < Test::Unit::TestCase
    def test_simple_compile
      code = Template.compile("hello")
      assert(code.index("hello"))
      assert(code.index("writer.write("))
    end
    
    def test_simple_render
      template = Template.new("hello")
      assert_equal("hello", template.render(nil))
    end
  end
end
