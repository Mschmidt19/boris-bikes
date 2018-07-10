require 'boris_bikes'

describe Bike do
  it 'repsonds to the method "working?"' do
    expect(subject).to respond_to(:working?)
  end
end
