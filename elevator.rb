class Elevator

  UP = 0;
  DOWN = 1;

  def initialize(size, waiting_time, capacity)
    @size = size
    @waiting_time = waiting_time
    @current_waiting_time = 0;
    @capacity = capacity
    @human_count = 0;
    @current_floor = 0
    @is_waiting = false;
    @direction = UP;
  end

  def update(requests, humans)
    if @is_waiting
      update_waiting_time
    else
      process_requests requests
    end
  end


  private
    def update_waiting_time
      @current_waiting_time -= 1;
      if @current_waiting_time == 0
        @is_waiting = false
      end
    end

    def process_requests(requests)
      if @human_count < @capacity
        requests.each do |request|
          check_request! request
        end
      end
    end

    def check_request!(request)
      if request.from == @current_floor && on_the_way?(request.to)

      end
    end

    def on_the_way?(to)
      (to - @current_floor > 0 && @direction == UP) || (to - @current_floor < 0 && @direction == DOWN)
    end
end
