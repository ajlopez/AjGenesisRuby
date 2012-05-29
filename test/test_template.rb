
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
    
    def test_compile_simple_interpolation
      code = Template.compile("${1+2}")
      assert(code.index("(1+2)"))
      assert(code.index("writer.write("))
    end

    def test_compile_simple_interpolations
      code = Template.compile("1 + 2 = ${1+2}; 3 + 4 = ${3+4}")
      assert(code.index("(1+2)"))
      assert(code.index("(3+4)"))
      assert(code.index("writer.write("))
      assert(code.index("1 + 2 = "))
      assert(code.index("3 + 4 = "))
    end

    def test_render_simple_interpolation
      template = Template.new("${1+2}")
      assert_equal("3", template.render(nil))
    end

    def test_render_simple_interpolation_with_model
      template = Template.new("${a+b}")
      assert_equal("3", template.render({ :a => 1, :b => 2}))
    end
  end
end
