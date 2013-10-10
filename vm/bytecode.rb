#
#                              Bytecode format
#
# Opcode          Operands                    Stack before /   after
# ------------------------------------------------------------------------------
PUSH_NUMBER = 0 # Number to push on the stack []               [result]
PUSH_SELF   = 1 #                             []               [self]
CALL        = 2 # Method, Number of arguments [receiver, args] [result]
RETURN      = 3
