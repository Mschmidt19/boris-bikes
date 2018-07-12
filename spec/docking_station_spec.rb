require 'docking_station'

describe DockingStation do

  it { should respond_to(:release_bike) }

  it { is_expected.to respond_to(:bike) } #test for attr_reader of bike

  #tests for dock method and ensures dock accepts one argument
  it { is_expected.to respond_to(:dock).with(1).argument }

  it "should return a working instance of class Bike" do
    new_bike = Bike.new
    subject.dock(new_bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'should respond to bike with a currently docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do
    it 'raises an error if there are no bikes available' do
      expect {subject.release_bike}.to raise_error('There are no available bikes')
    end

    it 'should release a bike if there is an available bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end


end
