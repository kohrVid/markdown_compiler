require_relative '../lib/token.rb'

RSpec.describe Token, type: :model do
  let(:token) { Token.new(type: 'TEXT', value: 'example') }

  it 'should raise an error if initialised without params' do
    expect {
      Token.new(type: nil, value: nil)
    }.to raise_error(InvalidTokenError)
  end

  describe '.null' do
    subject { Token.null }

    it { is_expected.to be_a NullToken }
  end

  describe '.end_of_file' do
    subject { Token.end_of_file }

    it { is_expected.to be_a Token }

    it 'is has the type EOF' do
      expect(subject.type).to eq('EOF')
    end
  end

  describe '#length' do
    subject { token.length }

    it { is_expected.to eq 7 }
  end

  describe '#null?' do
    subject { token.null? }

    it { is_expected.to eq false }
  end

  describe '#present?' do
    subject { token.present? }

    it { is_expected.to eq true }
  end

  describe 'to_s' do
    subject { token.to_s }

    it { is_expected.to eq '<type: TEXT, value: example>' }
  end
end
