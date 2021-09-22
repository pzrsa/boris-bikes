require "./lib/bike"

class DockingStation
  # attr_reader :bike
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    if empty? || !@bikes.last.working?
      raise "No bikes available"
    end

    @bikes.pop
  end

  def dock(bike, is_working = true)
    if full?
      raise "No space left to dock"
    end

    if !is_working
      bike.report_broken
      @bikes.unshift(bike)
    else
      @bikes << bike
    end

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
