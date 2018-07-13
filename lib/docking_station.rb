require_relative 'bike'

class DockingStation

  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'There are no available bikes' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Capacity is full' if full?
    @bikes.push(bike)
    @bikes[@bikes.length - 1]
  end

  attr_reader :bikes

  attr_reader :capacity
  
  private
  def full?
    !!(@bikes.length >= @capacity)
  end

  def empty?
    !!@bikes.empty?
  end

end
