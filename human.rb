class Human
  attr_accessor :request_floor, :current_floor, :request

  def initialize(request_floor)
    @current_floor = Random.rand(4);
    @request_floor = request_floor
    @is_need_elevator = true
    @request
  end

  def is_need_elevator?
    @is_need_elevator
  end
end