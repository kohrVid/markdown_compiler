require_relative '../../lib/token.rb'
require_relative '../../lib/scanners/simple_scanner.rb'

RSpec.describe Scanners::SimpleScanner, type: :model do
  describe '.from_string' do
    context 'when an underscore' do
      subject { Scanners::SimpleScanner.from_string('_') }

      it { is_expected.to be_a Token }

      it 'is the correct type of token' do
        expect(subject.type).to eq 'UNDERSCORE'
      end

      it 'returns the correct value' do
        expect(subject.value).to eq '_'
      end
    end

    context 'when an asterisk' do
      subject { Scanners::SimpleScanner.from_string('*') }

      it { is_expected.to be_a Token }

      it 'is the correct type of token' do
        expect(subject.type).to eq 'ASTERISK'
      end

      it 'returns the correct value' do
        expect(subject.value).to eq '*'
      end
    end

    context 'when a new line' do
      subject { Scanners::SimpleScanner.from_string("\n") }

      it { is_expected.to be_a Token }

      it 'is the correct type of token' do
        expect(subject.type).to eq 'NEWLINE'
      end

      it 'returns the correct value' do
        expect(subject.value).to eq "\n"
      end
    end

    context 'when an open bracket' do
      subject { Scanners::SimpleScanner.from_string('(') }

      it { is_expected.to be_a Token }

      it 'is the correct type of token' do
        expect(subject.type).to eq 'OPEN_BRACKET'
      end

      it 'returns the correct value' do
        expect(subject.value).to eq '('
      end
    end

    context 'when an open square bracket' do
      subject { Scanners::SimpleScanner.from_string('[') }

      it { is_expected.to be_a Token }

      it 'is the correct type of token' do
        expect(subject.type).to eq 'OPEN_SQUARE_BRACKET'
      end

      it 'returns the correct value' do
        expect(subject.value).to eq '['
      end
    end

    context 'when a closed bracket' do
      subject { Scanners::SimpleScanner.from_string(')') }

      it { is_expected.to be_a Token }

      it 'is the correct type of token' do
        expect(subject.type).to eq 'CLOSED_BRACKET'
      end

      it 'returns the correct value' do
        expect(subject.value).to eq ')'
      end
    end

    context 'when a closed square bracket' do
      subject { Scanners::SimpleScanner.from_string(']') }

      it { is_expected.to be_a Token }

      it 'is the correct type of token' do
        expect(subject.type).to eq 'CLOSED_SQUARE_BRACKET'
      end

      it 'returns the correct value' do
        expect(subject.value).to eq ']'
      end
    end

    context 'when invalid' do
      subject { Scanners::SimpleScanner.from_string('abc') }

      it { is_expected.to be_a NullToken }
    end
  end
end
