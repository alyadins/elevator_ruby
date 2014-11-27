require 'colorize'
require_relative 'elevator'
require_relative 'request'
require 'benchmark'

class Building

  attr_accessor :requests, :find_times
  attr_reader :floors_count

  def initialize(floors, elevators_count, wait_time = 0, capacity)
    @floors_count = floors;
    @humans = Array.new
    @requests = Array.new
    create_elevators(floors, elevators_count, wait_time, capacity)
    @find_times = 0;
  end

  def add_new_humans(new_humans)
    @humans += new_humans
  end

  def update
    update_requests
     @elevators.each do |elevator|
       elevator.update(@requests)
     end
  end

  private
    def create_elevators(size, elevators_count, waiting_time, capacity)
      @elevators = Array.new
      elevators_count.times do
        elevator = Elevator.new(size, waiting_time, capacity)
        @elevators << elevator
      end
    end

    def update_requests
      @humans.each do |human|
        unless human.request_accepted?
          request = Request.new(human.current_floor, human.request_floor)

          old_request = @requests.find do |r|
            r == request
          end

          if old_request.nil?
            request.add_human(human)
            @requests << request
          else
            old_request.add_human(human)
          end
          human.accept_request
          requests.sort!
        end
      end
    end
end