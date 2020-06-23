require_relative '../lib/enumerable.rb'

RSpec.describe Enumerable, type: :module do
  it 'should cluster adjacent elements together based on a block' do
    expect(
      [2,2,2,3,3,4,2,2,1].cluster{ |x| x }
    ).to eq([[2, 2, 2], [3, 3], [4], [2, 2], [1]])
  end
end
