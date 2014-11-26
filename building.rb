require 'colorize'
require_relative 'elevator'
require_relative 'request'

class Building

  attr_accessor :requests
  attr_reader :floors_count

  def initialize(floors, elevators_count, wait_time = 0, capacity)
    @floors_count = floors;
    @humans = Array.new
    @requests = Array.new
    create_elevators(floors, elevators_count, wait_time, capacity)
  end

  def add_new_humans(new_humans)
    @humans += new_humans
  end

  def update
    update_requests
    @elevators.each do |elevator|
      elevator.update(@requests, @humans)
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
        if human.request.nil?
          request = Request.new(human.current_floor, human.request_floor)

          if @requests.include?(request)
            req = @requests.find {|r| r == request}
            req.add_human(human)
            human.request = req
          else
            request.add_human(human)
            human.request = request
            @requests << request
          end
        end
      end

      @requests.uniq
      @requests.sort!
    end
end