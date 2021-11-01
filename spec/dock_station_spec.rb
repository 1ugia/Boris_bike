require 'dock_station.rb'

describe Dockstation do
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
    it 'cannot go over capacity of 50 and raise error' do
      50.times {subject.dock(bike)}
      expect { raise subject.dock(bike) }.to raise_error('Too many bikes docked')
    end

    it 'has a DEFAULT capacity' do
      expect(subject.capacity).to eq Dockstation::DEFAULT_CAPACITY
    end

    it 'allows user to increase capacity fluidly' do
      old = Dockstation.new(20)
      expect(old.capacity).to eq 20
    end
  end

  context 'broken bike' do
    it 'allows to report broken bike to not release bike' do
      subject.dock(bike)
      allow(bike).to receive(:report_broken).and_return(false)
      allow(bike).to receive(:working?).and_return(false)
      expect { raise subject.release }.to raise_error('Broken bike')
    end
  end

end