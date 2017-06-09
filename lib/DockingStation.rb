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
    fail "Bike is broken, you can't have it!" if @bikes.first.working == false
    @bikes.shift
  end

  def dock(bike)
    fail "The docking station is full" if full?
    @bikes << bike
    @bikes.last
  end

  def report_broken(bike)
    dock(bike)
    bike.working = false
  end

private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count < 1
  end
end
