require_relative '../lib/tokeniser.rb'

RSpec.describe Tokeniser, type: :model do
  let(:tokeniser) { Tokeniser.new }

  describe '#tokenise' do
    context 'when simple' do
      subject { tokeniser.tokenise('Hello') }

      it 'returns the right value first' do
        expect(subject.first.type).to eq 'TEXT'
        expect(subject.first.value).to eq 'Hello'
      end
    end

    context 'when underscore' do
      subject { tokeniser.tokenise('_Mew_') }

      it 'returns the right value first' do
        expect(subject.first.type).to eq 'UNDERSCORE'
        expect(subject.first.value).to eq '_'

        expect(subject.second.type).to eq 'TEXT'
        expect(subject.second.value).to eq 'Mew'

        expect(subject.third.type).to eq 'UNDERSCORE'
        expect(subject.third.value).to eq '_'
      end
    end

    context 'when paragraph' do
      subject { tokeniser.tokenise("Hello, World!
This is a _quite_ **long** text for what we've been testing so far.
And this is another para.") }

      it 'returns the right value first' do
        expect(subject.first.type).to eq 'TEXT'
        expect(subject.first.value).to eq 'Hello, World!'

        expect(subject.second.type).to eq 'NEWLINE'
        expect(subject.second.value).to eq "\n"

        expect(subject.third.type).to eq 'TEXT'
        expect(subject.third.value).to eq 'This is a '

        expect(subject.fourth.type).to eq 'UNDERSCORE'
        expect(subject.fourth.value).to eq '_'

        expect(subject.fifth.type).to eq 'TEXT'
        expect(subject.fifth.value).to eq 'quite'

        expect(subject.sixth.type).to eq 'UNDERSCORE'
        expect(subject.sixth.value).to eq '_'

        expect(subject.seventh.type).to eq 'TEXT'
        expect(subject.seventh.value).to eq ' '

        expect(subject.eighth.type).to eq 'ASTERISK'
        expect(subject.eighth.value).to eq '*'

        expect(subject.ninth.type).to eq 'ASTERISK'
        expect(subject.ninth.value).to eq '*'
      end
    end
  end
end
