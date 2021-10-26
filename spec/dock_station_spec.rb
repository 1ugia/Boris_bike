require 'dock_station.rb'

describe Dockstation do
  # bike1 = Bike.new
  # bike2 = Bike.new
  let(:bike) { double :bike }

  context 'dockingstation' do

    it 'docks a bike' do
      expect(subject.dock(bike)).to eq [bike]
    end
    
  end

  context 'releasing bike' do

    it 'releases a bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release).to eq bike
    end
    
    it 'when empty, doesn not release bike' do
      expect { subject.release }.to raise_error 'No bikes'
    end

    it 'to raise error if bike is broken' do
      allow(bike).to receive(:working?).and_return(false)
      # ----- way to substitute a method from a different class 
      # and return the value you want it to return ------
      subject.dock(bike)
      expect { subject.release }.to raise_error 'Broken bike'
    end
  end

  context 'capacity' do
    it 'has a capacity of 50' do
      # subject.dock( 50.times { Bike.new } )
      50.times {subject.dock(Bike.new)}
      expect { raise subject.dock(bike) }.to raise_error('Too many bikes docked')
    end
  end

end