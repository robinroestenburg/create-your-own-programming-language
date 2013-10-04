class IdentifierTokenizer < Struct.new(:identifier, :tokenizer)

  KEYWORDS = ['while', 'def', 'class', 'if', 'true', 'false', 'nil']

  def tokenize
    tokenizer.
      move_position_right_by(steps).
      add_tokens(tokens)
  end

  def steps
    identifier.size
  end

  def tokens
    if KEYWORDS.include? identifier
      [identifier.upcase.to_sym, identifier]
    else
      [:IDENTIFIER, identifier]
    end
  end

end

