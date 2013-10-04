class NumberTokenizer < Struct.new(:number, :tokenizer)

  def tokenize
    tokenizer.
      move_position_right_by(steps).
      add_tokens(tokens)
  end

  def steps
    number.size
  end

  def tokens
    [:NUMBER, number.to_i]
  end

end
