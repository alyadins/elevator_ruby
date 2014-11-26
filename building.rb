class Building

  def initialize(floors, elevators, wait_time = 0)
    @floors = floors;
    @elevators = elevators
    @wait_time = wait_time
  end
end