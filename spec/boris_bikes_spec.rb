require 'boris_bikes'

describe DockingStation do
  it 'repsonds to the method "release_bike"' do
    expect(subject).to respond_to(:release_bike)
  end
end
