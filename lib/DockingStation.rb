require_relative "../lib/Bike.rb"

class DockingStation
  attr_accessor :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "There are no more bikes available" if empty?
    find_working
    if @working_bike != nil
      @working_bike
      @bikes.delete_at(@index)
    else
      fail "No working bikes available!"
    end
  end

  def find_working
    @index = @bikes.find_index { |bike| bike.working? == true }
      @index != nil ? @working_bike = @bikes[@index] : @working_bike = nil
  end

  def dock(bike)
    fail "The docking station is full" if full?
    @bikes << bike
    @bikes.last
  end

private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count < 1
  end
end
