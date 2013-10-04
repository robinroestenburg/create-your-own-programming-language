class WhitespaceTokenizer < Struct.new(:whitespace, :tokenizer)

  def tokenize
    tokenizer.
      move_position_right_by(steps).
      add_tokens(tokens)
  end

  def steps
    1
  end

  def tokens
  end

end
