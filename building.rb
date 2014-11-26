require 'colorize'
require_relative 'elevator'

class Building

  def initialize(floors, elevators_count, wait_time = 0, capacity)
    create_elevators(floors, elevators_count, wait_time, capacity)
  end

  private
    def create_elevators(size, elevators_count, waiting_time, capacity)
      @elevators = Array.new
      elevators_count.times do
        elevator = Elevator.new(size, waiting_time, capacity)
        @elevators << elevator
      end
    end
end