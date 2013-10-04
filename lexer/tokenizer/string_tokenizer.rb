class StringTokenizer < Struct.new(:string, :tokenizer)

  def tokenize
    tokenizer.
      move_position_right_by(steps).
      add_tokens(tokens)
  end

  def steps
    string.size + 2
  end

  def tokens
    [:STRING, string]
  end

end
