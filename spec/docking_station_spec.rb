require "docking_station"
# require "bike"

describe DockingStation do
  describe "#release_bike" do
    it { is_expected.to respond_to(:release_bike) }

    it "releases a working bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
      # expect(bike.working?).to eq true
    end
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks a used bike" do
      bike = Bike.new
      station = DockingStation.new
      expect(station.dock(bike)).to eq bike
    end
  end

  describe "#bikes" do
    # it { is_expected.to respond_to(:bike) }
    it { is_expected.to respond_to(:bikes) }

    it "shows a list of docked bikes" do
      bike = Bike.new
      station = DockingStation.new
      station.dock(bike)
      expect(station).to respond_to(:bikes)
    end
  end

  it "raises an error when no bikes are available" do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end

  it "can add custom capacity to the station" do
    station = DockingStation.new(2)
    2.times {station.dock(Bike.new)}
    expect {station.dock(Bike.new)}.to raise_error "No space left to dock"
  end

  it "does not release broken bikes" do
    station = DockingStation.new
    2.times {station.dock(Bike.new)}
    station.dock(Bike.new, false)
    expect {station.release_bike}.not_to raise_error
  end
end
