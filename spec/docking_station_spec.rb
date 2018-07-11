require 'docking_station'

describe DockingStation do
  it { should respond_to(:release_bike) }

=begin
  it "should return an instance of class Bike" do
    bike = subject.release_bike
    expect(bike).to be_a(Bike)
  end
=end

  it "should return a working instance of class Bike" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'should be able to dock a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

=begin
  it "should be able to dock a bike" do
    @bike = subject.release_bike
    expect(subject.dock_bike(@bike))
  end
=end
end
