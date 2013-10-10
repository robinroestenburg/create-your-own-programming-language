require 'test_helper'
require 'parser/parser'

class ParserTest < Test::Unit::TestCase

  def test_method_with_param
    code = <<-CODE
  def method(a, b):
    true
CODE

    nodes = Nodes.new([
      DefNode.new(
        'method',
        ['a', 'b'],
        Nodes.new([TrueNode.new])
      )
    ])

    assert_equal nodes, Parser.new.parse(code)
  end

end
