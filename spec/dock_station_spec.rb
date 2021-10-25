require 'dock_station.rb'

describe Dockstation do
  ds = Dockstation.new
  bike1 = Bike.new
  bike2 = Bike.new

  
  it 'docks a bike' do
    expect(ds.dock(bike1)).to eq [bike1]
  end
  
  it 'allows to use the bike' do
    ds.dock(bike1)
    ds.ride(bike1)
    expect(subject).to_not eq(bike1)
  end
  
  it 'has a capacity of 50' do
    # subject.dock( 50.times { Bike.new } )
    50.times {subject.dock(Bike.new)}
    expect { raise subject.dock(bike2) }.to raise_error('Too many bikes docked')
  end
  
end