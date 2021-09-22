require "bike"

describe Bike do
  it { should respond_to(:working?) }

  it "can be reported as broken" do
    bike = Bike.new
    bike.report_broken
    expect(bike.working?).to eq false
  end
end
