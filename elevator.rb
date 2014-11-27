class Elevator

  UP = 1;
  DOWN = -1;

  def initialize(size, waiting_time, capacity)
    @size = size
    @waiting_time = waiting_time
    @current_waiting_time = 0;
    @capacity = capacity
    @humans_in = Array.new
    @current_floor = 0
    @is_waiting = false
    @direction = UP
    @moving = false
    @moving_to = 0
  end

  def update(requests)
    puts "update #{@is_waiting}"
    if @is_waiting
      update_waiting_time
    elsif @moving
      move
      if @current_floor == @moving_to
        start_wait
        @moving = false
      else
        check_requests(requests)
      end
    else
      start(requests)
    end
  end


  private
  def update_waiting_time
    puts "update wait time"
    @current_waiting_time -= 1;
    if @current_waiting_time == 0
      @is_waiting = false
    end
  end

  def start_wait
    puts "start wait"
    @is_waiting = true
    @current_waiting_time = @waiting_time
  end

  def check_requests(requests)
    unless @human_count == @capacity
      floor_requests = get_requests_by_floor(requests, @current_floor)
      puts floor_requests
    end
  end

  def get_requests_by_floor(requests, floor)
    floor_requests = requests.find_all{|r| r.from == floor}
  end

  def on_the_way?(to)
    (to - @current_floor > 0 && @direction == UP) || (to - @current_floor < 0 && @direction == DOWN)
  end

  def get_new_direction(to)
    if to > @current_floor
      UP
    else
      DOWN
    end
  end

  def get_best_request(requests)
    requests.min_by do |r|
      (r.from - @current_floor).abs
    end
  end

  def start(requests)
    puts "start"
    best_request = get_best_request(requests)

    puts "best_request #{best_request}"
    unless best_request.nil?
      @direction = get_new_direction(best_request.to)
      @moving = true
      @moving_to = best_request.to

      requests.delete(best_request)
      #puts "direction = #{@direction} moving = #{@moving} moving_to = #{@moving_to}"
      if best_request.from == @current_floor
        start_wait
      else
        move
      end

    end
  end

  def move
    @current_floor += @direction
    puts "move to #{@current_floor}"
  end
end