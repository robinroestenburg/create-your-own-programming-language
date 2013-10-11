require 'test_helper'
require 'runtime'
require 'vm'
require 'llvm_compiler'

class LLVMCompilerTest < Test::Unit::TestCase

  def test_compiling
    code = <<-CODE
def say_it:
  x = "This is compiled!"
  puts(x)
say_it()
CODE

    node = Parser.new.parse(code)

    compiler = LLVMCompiler.new
    compiler.preamble
    node.llvm_compile(compiler)
    compiler.finish

    compiler.dump

    compiler.optimize
    compiler.run
  end

end
