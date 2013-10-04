class ConstantTokenizer < Struct.new(:constant, :tokenizer)

  def tokenize
    tokenizer.
      move_position_right_by(steps).
      add_tokens(tokens)
  end

  def steps
    constant.size
  end

  def tokens
    [:CONSTANT, constant]
  end

end
