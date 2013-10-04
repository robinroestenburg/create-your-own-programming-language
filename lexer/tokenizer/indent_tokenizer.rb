class IndentTokenizer < Struct.new(:indent, :tokenizer)

  def tokenize
    unless indent.size <= tokenizer.current_indent
      raise "Missing ':'"
    end

    tokenizer.
      move_position_right_by(steps).
      decrease_indents(indent.size).
      add_tokens(tokens)
  end

  def steps
    indent.size + 1
  end

  def tokens
    [:NEWLINE, "\n"]
  end

end
