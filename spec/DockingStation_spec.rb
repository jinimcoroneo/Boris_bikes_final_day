require 'DockingStation.rb'

describe DockingStation do

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
      bike = Bike.new
      subject.report_broken(bike)
      expect{ (subject.release_bike) }.to raise_error "Bike is broken, you can't have it!"
    end

    it 'gets a bike' do
      subject.dock(Bike.new)
      bike = subject.release_bike
        expect(bike).to be_a_kind_of(Bike)
        expect(bike).to be_working
    end
  end

  describe '#dock' do
    it 'raises an error when the docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect{subject.dock Bike.new}.to raise_error("The docking station is full")
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq subject.bikes.last
    end
  end

  describe '#report_broken' do
    it "allows you to report the bike as broken when you return it" do
      bike = Bike.new
      subject.report_broken(bike)
      expect(bike.condition).to eq "bad"
    end
  end
end
