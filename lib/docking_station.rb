require "./lib/bike"

class DockingStation
  # attr_reader :bike
  attr_reader :bikes

  def initialize
    @capacity = 20
    @bikes = []
  end

  def release_bike
    if empty?
      raise "No bikes available"
    end
    @bikes.pop
  end

  def dock(bike)
    if full?
      raise "No space left to dock"
    end
    @bikes << bike
    bike
  end

  private

  def full?
    @bikes.length == @capacity
  end

  def empty?
    @bikes.empty?
  end
end
