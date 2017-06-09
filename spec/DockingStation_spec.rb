require 'DockingStation.rb'

describe DockingStation do

  let(:bike) { double :bike }

  describe '#capacity' do
    it 'allows you to set a capacity' do
      station = DockingStation.new(40)
      expect(station.capacity).to eq 40
    end

    it 'gets the default capacity when nothing is set' do
      expect(subject.capacity).to eq 20
    end
  end

  it { is_expected.to respond_to(:release_bike) }

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error("There are no more bikes available")
    end

    it 'won\'t release a broken bike' do
      allow(bike).to receive(:broken?).and_return(true)
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect{ (subject.release_bike) }.to raise_error "No working bikes available!"
    end

    it 'will release a working bike' do
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike.working?).to eq true
    end
  end

  describe '#dock' do
    it 'raises an error when the docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
      expect{subject.dock(double(:bike))}.to raise_error("The docking station is full")
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      bike = double(:bike)
      expect(subject.dock(bike)).to eq subject.bikes.last
    end
  end
end
