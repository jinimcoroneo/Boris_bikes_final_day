class Bike

  attr_accessor :working

  def initialize(working = true)
    @working = working
  end

  def working?
    self.working
  end

end
