require_relative './token_list.rb'
Dir[File.join(__dir__, 'scanners', '*.rb')].each { |file| require file }

class Tokeniser
  def tokenise(plain_markdown)
    tokens_array = tokens_as_array(plain_markdown)
    TokenList.new(tokens_array)
  end

  private

  def tokens_as_array(plain_markdown)
    if plain_markdown.nil? || plain_markdown == ''
      [Token.end_of_file]
    else
      plain_markdown.chars.map do |char|
        scan_one_token(char)
      end.cluster(&:type).flat_map do |token_cluster|
        if token_cluster.first.type == 'TEXT'
          scan_one_token(token_cluster.map(&:value).reduce(:+))
        else
        token_cluster
        end
      end
    end
  end

  def scan_one_token(plain_markdown)
    token = Scanners::SimpleScanner.from_string(plain_markdown)

    case token
    when NullToken
      Scanners::TextScanner.from_string(plain_markdown)
    when Token
      token
    else
      raise "The scanners could not match the given input: #{plain_markdown}"
    end
  end
end
