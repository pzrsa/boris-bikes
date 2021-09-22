require "./lib/bike"

class DockingStation
  # attr_reader :bike
  attr_reader :bikes

  def initialize
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
    @bikes << bike
    bike
  end
end
