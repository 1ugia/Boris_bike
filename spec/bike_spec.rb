require 'bike.rb'

describe Bike do
  it 'tells you bike exists' do
    b = Bike.new
    expect(b.working?).to eq true
  end
end
