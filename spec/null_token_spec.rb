require_relative '../lib/null_token.rb'

RSpec.describe NullToken, type: :model do
  let(:token) { NullToken.new }

  describe '#null?' do
    subject { token.null? }

    it { is_expected.to eq true }
  end

  describe '#present?' do
    subject { token.present? }

    it { is_expected.to eq false }
  end
end
