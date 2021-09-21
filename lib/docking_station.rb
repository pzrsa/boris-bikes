require "./lib/bike"

class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    @bike = Bike.new
    @bike
  end

  def dock_bike(bike)
    @bikes << bike
    "Your bike has successfully been docked."
  end

  def show_bikes
    @bikes
  end
end
