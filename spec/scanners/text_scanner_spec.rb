require_relative '../../lib/token.rb'
require_relative '../../lib/scanners/text_scanner.rb'

RSpec.describe Scanners::TextScanner, type: :model do
  describe '.from_string' do
    subject { Scanners::TextScanner.from_string('example') }

    it { is_expected.to be_a Token }

    it 'is the correct type of token' do
      expect(subject.type).to eq 'TEXT'
    end

    it 'returns the correct value' do
      expect(subject.value).to eq 'example'
    end
   
    context 'when there is more than one token' do
      subject { Scanners::TextScanner.from_string('example*') }

      it 'returns the correct value' do
        expect(subject.value).to eq 'example'
      end
    end
  end
end
