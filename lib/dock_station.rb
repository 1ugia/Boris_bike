require_relative './bike.rb'

class Dockstation
  attr_reader :station, :bike, :capacity
  DEFAULT_CAPACITY = 50

  def initialize
    @station = []
    @capacity = DEFAULT_CAPACITY
  end

  def dock(bike)
    fail 'Too many bikes docked' if full?
    @station << bike
  end
  
  def release
    fail 'No bikes' if empty?
    fail 'Broken bike' if @station.last.working? == false
    @station.pop
  end

  private

  def full?
    @station.count >= @capacity
  end

  def empty?
    @station.count == 0
  end

end