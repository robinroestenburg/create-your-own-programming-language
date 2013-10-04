class Lexer

  IDENTIFIER      = /\A([a-z]\w*)/
  CONSTANT        = /\A([A-Z]\w*)/
  NUMBER          = /\A([0-9]+)/
  STRING          = /\A"([^"]*)"/
  LONG_OPERATOR   = /\A(\|\||&&|==|!=|<=|>=)/
  WHITESPACE      = /\A /
  INDENT          = /\A\n( *)/m   # Matches "<newline> <spaces>"
  EXPLICIT_INDENT = /\A\:\n( +)/m # Matches ": <newline> <spaces>"


  def tokenize(code)
    code.chomp!
    tokenizer = Tokenizer.new

    while tokenizer.position < code.size
      chunk = code[tokenizer.position..-1]

      tokenizer = if identifier = chunk[IDENTIFIER, 1]
                    IdentifierTokenizer.new(identifier, tokenizer).tokenize
                  elsif constant = chunk[CONSTANT, 1]
                    ConstantTokenizer.new(constant, tokenizer).tokenize
                  elsif number = chunk[NUMBER, 1]
                    NumberTokenizer.new(number, tokenizer).tokenize
                  elsif string = chunk[STRING, 1]
                    StringTokenizer.new(string, tokenizer).tokenize
                  elsif indent = chunk[EXPLICIT_INDENT, 1]
                    ExplicitIndentTokenizer.new(indent, tokenizer).tokenize
                  elsif indent = chunk[INDENT, 1]
                    IndentTokenizer.new(indent, tokenizer).tokenize
                  elsif operator = chunk[LONG_OPERATOR, 1]
                    LongOperatorTokenizer.new(operator, tokenizer).tokenize
                  elsif chunk.match(WHITESPACE)
                    WhitespaceTokenizer.new('', tokenizer).tokenize
                  else
                    OperatorTokenizer.new(chunk[0,1], tokenizer).tokenize
                  end
    end

    tokenizer.decrease_indents.tokens
  end

end

require_relative 'tokenizer/tokenizer'
require_relative 'tokenizer/indent_tokenizer'
require_relative 'tokenizer/identifier_tokenizer'
require_relative 'tokenizer/constant_tokenizer'
require_relative 'tokenizer/number_tokenizer'
require_relative 'tokenizer/string_tokenizer'
require_relative 'tokenizer/explicit_indent_tokenizer'
require_relative 'tokenizer/whitespace_tokenizer'
require_relative 'tokenizer/long_operator_tokenizer'
require_relative 'tokenizer/operator_tokenizer'
