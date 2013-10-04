class Tokenizer

  attr_reader :tokens, :current_indent, :indent_stack, :position

  def initialize(args = {})
    @tokens         = args.fetch(:tokens, [])
    @current_indent = args.fetch(:current_indent, 0)
    @indent_stack   = args.fetch(:indent_stack, [])
    @position       = args.fetch(:position, 0)
  end

  def arguments
    {
      tokens:         tokens,
      current_indent: current_indent,
      indent_stack:   indent_stack,
      position:       position
    }
  end

  def move_position_right_by(steps)
    Tokenizer.new(arguments.merge({
      position: position + steps
    }))
  end

  def add_tokens(new_tokens)
    Tokenizer.new(arguments.merge({
      tokens: tokens + [new_tokens].compact,
    }))
  end

  def increase_indent(indent_size)
    Tokenizer.new(arguments.merge({
      current_indent: indent_size,
      indent_stack: indent_stack + [indent_size],
    }))
  end

  def decrease_indents(new_indent = 0)
    (new_indent...current_indent).reduce(self, :decrease_indent)
  end

  def decrease_indent(new_indent)
    return self if new_indent > current_indent

    new_indent_stack   = indent_stack[0..-2]
    new_current_indent = new_indent_stack.last || 0

    Tokenizer.new(arguments.merge({
      tokens:         tokens + [[:DEDENT, new_current_indent]],
      current_indent: new_current_indent,
      indent_stack:   new_indent_stack,
    }))
  end

end
