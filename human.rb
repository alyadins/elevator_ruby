class Human
  attr_accessor :request_floor, :current_floor

  def initialize(request_floor)
    @current_floor = 0
    @request_floor = request_floor
    @is_need_elevator = true
    @is_request_accepted = false;
  end

  def need_elevator?
    @is_need_elevator
  end

  def request_accepted?
    @is_request_accepted
  end

  def accept_request
    @is_request_accepted = true
  end

  def clear_request
    @is_request_accepted = false;
  end
end