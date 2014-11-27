require 'colorize'
require_relative 'building'
require_relative 'world'

debug = true

def get_param(min, error_message)
  loop {
    param = gets.to_i
    if param < min
      puts error_message
    else
      return param
    end
  }
end

if debug
  floors = 5
  elevators_count = 1
  waiting_time = 2
  capacity = 4
else
  puts "Здравствуй человек. Я лифто-симулятор."
  puts "Мне нужна информация о здании и лифтах"
  puts "Сколько этажей в твоем здании?"

  floors = get_param(2, "Количество этажей задано неверно".red)
  puts "Создано здание с #{floors} этажами"

  puts "Теперь разберемся с лифтами"
  puts "Сколько их в твоем здании?"
  elevators_count = get_param(1, "Нужно боооольше лифтов".red)
  puts "В здание помещено #{elevators_count} лифтов"

  puts "Теперь параметры лифтов"
  puts "Сколько времени лифт стоит на этаже?"
  waiting_time = get_param(1, "Время должно быть временем!!!!!111".red)
  if waiting_time > 1
    puts "Создан медленный лифт который стоит на этаже вечность(#{waiting_time} времени)"
  else
    puts "Быстрые лифты помещены в здание"
  end

  puts "Какова вместимость лифтов?"
  capacity = get_param(2, "Минимальное число пассажиров равно 2".red)
end

world = World.new
building = Building.new(floors, elevators_count, waiting_time, capacity)
world.set_building building

world.start



