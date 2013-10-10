require 'test_helper'
require 'runtime'
require 'vm'

class VmTest < Test::Unit::TestCase

  def test_simple_addition
    bytecode = [
      # opcode      operands      stack after     description
      # ------------------------------------------------------------------------
      PUSH_NUMBER,  1,          # stack = [1]     push 1, the receiver of "+"
      PUSH_NUMBER,  2,          # stack = [1, 2]  push 2, the argument for "+"
      CALL,         "+", 1,     # stack = [3]     cal 1.+(2) and push the result
      RETURN                    # stack = []
    ]

    result = VM.new.run(bytecode)

    assert_equal 3, result.ruby_value
  end

end
