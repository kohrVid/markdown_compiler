require_relative '../token.rb'

module Scanners
  class SimpleScanner
    TOKEN_TYPES = {
      '_'  => 'UNDERSCORE',
      '*'  => 'ASTERISK',
      "\n" => 'NEWLINE',
      '(' => 'OPEN_BRACKET',
      '[' => 'OPEN_SQUARE_BRACKET',
      ')' => 'CLOSED_BRACKET',
      ']' => 'CLOSED_SQUARE_BRACKET',
    }.freeze

    def self.from_string(plain_markdown)
      char = plain_markdown[0]
      Token.new(type: TOKEN_TYPES[char], value: char)
    rescue InvalidTokenError
      Token.null
    end
  end
end
