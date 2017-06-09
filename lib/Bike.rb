class Bike

  attr_accessor :working

  def initialize(working = true)
    @working = working
  end

  def working?
    self.working
  end

  def broken?
    working? == false
  end

  def break
    self.working = false
    self
  end

end
