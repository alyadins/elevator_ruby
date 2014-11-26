require_relative 'building'

class World
  LIVE_TIME = 1000

  def initialize
    @buildings = Array.new
  end

  def add_building(building)
    @buildings << building

    puts @buildings.length
  end

  def start
    LIVE_TIME.times do |index|
    end
  end
end