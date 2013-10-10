class VM

  def run(bytecode)

    stack = []
    ip    = 0

    while true
      case bytecode[ip]

      when PUSH_NUMBER
        ip += 1
        value = bytecode[ip]
        stack.push Constants['Number'].new_with_value(value)

      when PUSH_SELF
        stack.push RootContext.current_self

      when CALL
        ip += 1
        method = bytecode[ip]

        ip += 1
        argc = bytecode[ip]

        args = []
        argc.times do
          args << stack.pop
        end
        receiver = stack.pop

        stack.push receiver.call(method, args)

      when RETURN
        return stack.pop

      end

      ip += 1
    end

  end

end # class VM
