require_relative 'request'
require_relative 'human'
req1 = Request.new(1, 4)
req2 = Request.new(1, 4)

human = Human.new(30)
req1.add_human(human)

puts req1 == req2