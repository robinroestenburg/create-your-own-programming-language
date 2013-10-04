class LongOperatorTokenizer < Struct.new(:operator, :tokenizer)

  def tokenize
    tokenizer.
      move_position_right_by(steps).
      add_tokens(tokens)
  end

  def steps
    operator.size
  end

  def tokens
    [operator, operator]
  end

end
