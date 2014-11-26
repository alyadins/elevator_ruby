require_relative 'building'
require_relative 'human'

class World
  LIVE_TIME = 300;
  HUMAN_PORTION_SIZE = 3;

  def initialize
    @humans = Array.new
  end

  def set_building(building)
    @building = building
  end

  def start
    @all_humans_count = 0;
    LIVE_TIME.times do |i|
      @building.add_new_humans(create_new_humans)
      @building.update
    end

    puts "MAIN #{@building.requests[0].from} #{@building.requests[0].to}".red
    @building.requests[0].humans.each do |h|
        puts "#{h.request_floor} #{h.current_floor} #{h.request}"
    end
    # req_hum = 0;
    # r = @building.requests
    # r.each do |req|
    #     puts "from #{req.from} to #{req.to} humans = #{req.humans.size}"
    #   req_hum += req.humans.size
    # end
    #
    # puts "#{@all_humans_count} #{req_hum}"
  end

  private
    def create_new_humans
      new_humans = Array.new
      new_humans_count = Random.rand(HUMAN_PORTION_SIZE) + 1;
      new_humans_count.times do
        request_floor = Random.rand(@building.floors_count - 1) + 1;
        new_human = Human.new(request_floor);
        new_humans << new_human
      end

      @all_humans_count += new_humans.count
      new_humans
    end
end