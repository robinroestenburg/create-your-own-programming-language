require 'rubygems'
require 'parser'
# require 'nodes'

require 'llvm/core'
require 'llvm/execution_engine'
require 'llvm/transforms/scalar'

LLVM.init_x86

class LLVMCompiler

  PCHAR = LLVM.Pointer(LLVM::Int8)
  INT   = LLVM::Int

end
