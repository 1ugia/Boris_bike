require 'dock_station.rb'

describe Dockstation do
  bike1 = Bike.new
  bike2 = Bike.new

  context 'dockingstation' do 
    before do
      bike1 = Bike.new
    end

    it 'docks a bike' do
      expect(subject.dock(bike1)).to eq [bike1]
    end
    
  end

  context 'releasing bike' do
    before do
      bike1 = Bike.new
    end

    it 'releases a bike' do
      subject.dock(bike1)
      expect(subject.release).to eq bike1
    end
    
    it 'when empty, doesn not release bike' do
      expect { subject.release }.to raise_error 'No bikes'
    end

    it 'to raise error if bike is broken' do
      #---------------------------------------
    end
  end

  context 'capacity' do
    it 'has a capacity of 50' do
      # subject.dock( 50.times { Bike.new } )
      50.times {subject.dock(Bike.new)}
      expect { raise subject.dock(bike2) }.to raise_error('Too many bikes docked')
    end
  end
  
end