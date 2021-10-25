require 'bike.rb'

describe Bike do

  it 'tells you bike exists' do
    expect(subject.working?).to eq true
  end

  it 'tells you about broken bike' do
    expect(subject.broken).to eq false
  end #state of broken bike rather behaviour


end
