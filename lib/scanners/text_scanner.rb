require_relative '../token.rb'
require_relative './simple_scanner.rb'

module Scanners
  class TextScanner
    def self.from_string(plain_markdown)
      text = plain_markdown.each_char
        .take_while { |char| SimpleScanner.from_string(char).null? }
        .join('')

      Token.new(type: 'TEXT', value: text)
    rescue InvalidTokenError
      Token.null
    end
  end
end
