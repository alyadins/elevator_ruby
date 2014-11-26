require_relative 'building'

class World
  LIVE_TIME = 1000

  def initialize
    @humans = Array.new
  end

  def set_building(building)
    @building = building
  end

  def start
    LIVE_TIME.times do |i|
      create_new_humans
    end
  end

  private
    def create_new_humans
    end
end