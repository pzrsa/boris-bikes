require "docking_station"
require "bike"

describe DockingStation do
  station = DockingStation.new
  describe "#release_bike" do
    bike = Bike.new
    it { is_expected.to respond_to(:release_bike) }

    it "releases a working bike" do
      expect(station.release_bike.class).to eq Bike
      expect(station.release_bike.working?).to eq true
    end
  end

  describe "#dock" do
    bike = Bike.new
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks a used bike" do
      expect(station.dock(bike)).to eq bike
    end
  end

  describe "#bikes" do
    bike = Bike.new
    it { is_expected.to respond_to(:bike) }

    it "shows a list of docked bikes" do
      station.dock(bike)
      expect(station.bike).to eq bike
    end
  end
end
