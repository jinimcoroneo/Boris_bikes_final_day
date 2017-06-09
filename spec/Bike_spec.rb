require 'Bike'

describe Bike do
  it 'expects a new bike to be working' do
    expect(subject.working).to eq true
  end
end
