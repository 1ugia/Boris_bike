require_relative './bike.rb'

class Dockstation
  attr_reader :station
  def initialize
    # @b1 = Bike.new
    @station = []
  end

  def dock(bike)
    fail 'Too many bikes docked' if @station.count >= 50
    @station << bike
  end
  
  def ride(bike)
    @station.pop
  end
end