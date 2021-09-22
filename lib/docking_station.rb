require "./lib/bike"

class DockingStation
  # attr_reader :bike
  attr_reader :bikes

  def initialize
    @capacity = 20
    @bikes = []
  end

  def release_bike
    if @bikes.empty?
      raise "No bikes available"
    else
      @bikes.pop
    end
  end

  def dock(bike)
    if @bikes.length == @capacity
      raise "No space left to dock"
    end
    @bikes << bike
    bike
  end
end
