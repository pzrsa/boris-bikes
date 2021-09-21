require "docking_station"
require "bike"

describe DockingStation do
  bike = Bike.new
  station = DockingStation.new
  describe "#release_bike" do
    it { is_expected.to respond_to(:release_bike) }

    it "releases a working bike" do
      expect(station.release_bike.class).to eq Bike
      expect(station.release_bike.working?).to eq true
    end
  end
end
