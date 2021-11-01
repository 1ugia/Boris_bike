require_relative './bike.rb'

class Dockstation
  attr_reader :station, :bike, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @station = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Too many bikes docked' if full?
    @station << bike
  end
  
  def release
    fail 'No bikes' if empty?
    fail 'Broken bike' if check_broken
    @station.pop
  end
  
  private
  
  def full?
    @station.count >= @capacity
  end
  
  def empty?
    @station.count == 0
  end
  
  def check_broken
    @station.last.working? == false
  end

end