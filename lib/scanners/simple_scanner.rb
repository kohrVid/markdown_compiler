require_relative '../token.rb'

module Scanners
  class SimpleScanner
    def self.from_string(plain_markdown)
      char = plain_markdown[0]

      case char
      when '_'
        Token.new(type: "UNDERSCORE", value: char)
      when '*'
        Token.new(type: "ASTERISK", value: char)
      when "\n"
        Token.new(type: "NEWLINE", value: char)
      when '('
        Token.new(type: "OPEN_BRACKET", value: char)
      when '['
        Token.new(type: "OPEN_SQUARE_BRACKET", value: char)
      when ')'
        Token.new(type: "CLOSED_BRACKET", value: char)
      when ']'
        Token.new(type: "CLOSED_SQUARE_BRACKET", value: char)
      else
        Token.null
      end
    end
  end
end
