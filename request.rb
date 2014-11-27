class Request
  attr_accessor :to, :from, :humans
  include Comparable
  def initialize(from_floor, to_floor)
    @from = from_floor
    @to = to_floor
    @humans = Array.new
  end

  def add_human(human)
    @humans << human
  end

  def is_human_included?(human)
    @humans.include?(human)
  end

  def <=>(another)
    if self.from < another.from
      -1
    elsif self.from > another.from
      1
    elsif self.to < another.to
      -1
    elsif self.to > another.to
      1
    else
      0
    end
  end


  def to_s
    "from #{from} to #{to} humans #{humans.size}"
  end
end