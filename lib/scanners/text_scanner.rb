require_relative '../token.rb'
require_relative './simple_scanner.rb'

module Scanners
  class TextScanner
    def self.from_string(plain_markdown)
      Token.new(type: 'TEXT', value: plain_markdown)
    rescue InvalidTokenError
      Token.null
    end
  end
end
