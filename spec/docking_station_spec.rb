require 'docking_station'

describe DockingStation do

  describe '#bikes' do
    it { is_expected.to respond_to(:bikes) } #test for attr_reader of bikes

    it 'should respond to bikes with a currently docked bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes[0]).to eq bike
    end
  end

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity) } #test for attr_reader of capacity
  end

  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    it 'raises an error if there are no bikes available' do
      expect {subject.release_bike}.to raise_error('There are no available bikes')
    end

    it 'should release a bike if there is an available bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    #this may be better to put in bikes_spec.rb
    it "should release a working bike" do
      new_bike = Bike.new
      subject.dock(new_bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

  describe '#dock' do
    #tests for dock method and ensures dock accepts one argument
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'when using default capacity, raises an error if there is already 20 bikes docked' do
      subject.capacity.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error('Capacity is full')
    end

    it 'when using default capacity, can dock 20 bikes' do
      subject.capacity.times {subject.dock(Bike.new)}
      expect(subject.bikes.length).to eq subject.capacity
    end

    it 'when specifying a capacity of 30, raises an error if there is already 30 bikes docked' do
      ds_30 = DockingStation.new(30)
      ds_30.capacity.times {ds_30.dock(Bike.new)}
      expect {ds_30.dock(Bike.new)}.to raise_error('Capacity is full')
    end

    it 'when specifying a capacity of 30, does not raise an error when docking 21 bikes' do
      ds_30 = DockingStation.new(30)
      20.times {ds_30.dock(Bike.new)}
      expect {ds_30.dock(Bike.new)}.to_not raise_error
    end

    it 'when specifying a capacity of 30, can dock 30 bikes' do
      ds_30 = DockingStation.new(30)
      ds_30.capacity.times {ds_30.dock(Bike.new)}
      expect(ds_30.bikes.length).to eq ds_30.capacity
    end
  end

end
