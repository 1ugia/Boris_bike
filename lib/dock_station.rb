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
  
  def release
    fail 'No bikes' if @station.empty?
    @station.pop
  end

end