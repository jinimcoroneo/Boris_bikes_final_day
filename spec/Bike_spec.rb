require 'Bike'

describe Bike do
  it 'expects a new bike to be working' do
    expect(subject.working).to eq true
  end

  describe "#broken?" do
    it "checks if a bike is broken" do
      expect(subject).not_to be_broken
    end
  end

  describe "#working?" do
    it "checks if a bike is working" do
      expect(subject).to be_working
    end
  end

  describe "#break" do
    it "changes the status of a bike to not working" do
      subject.break
      expect(subject.working?).to be false
    end
  end
end
