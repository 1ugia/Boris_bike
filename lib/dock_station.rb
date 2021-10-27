require_relative './bike.rb'

class Dockstation
  attr_reader :station, :bike

  def initialize
    @station = []
  end

  def dock(bike)
    fail 'Too many bikes docked' if full?
    @station << bike
  end
  
  def release
    fail 'No bikes' if @station.empty?
    fail 'Broken bike' if @station.last.working? == false
    @station.pop
  end

  private

  def full?
    @station.count >= 50
  end

  def empty?
    @station.count == 0
  end

end