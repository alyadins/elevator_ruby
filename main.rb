require 'colorize'
require_relative 'building'
require_relative 'world'

debug = false;

def get_floors
  loop {
    floors = gets.to_i
    if floors < 2
      puts "Количество этажей задано неверно".red
    else
      return floors;
    end
  }
end


def get_elevators_count
  loop {
    elevators = gets.to_i
    if elevators < 1
      puts "Нужно боооольше лифтов".red
    else
      return elevators
    end
  }
end


def get_waiting_time
  loop {
    time = gets.to_i
    if time < 1
      puts "Время должно быть временем!!!!!111".red
    else
      return time
    end
  }
end

unless debug
  puts "Здравствуй человек. Я лифто-симулятор."
  puts "Мне нужна информация о здании и лифтах"
  puts "Сколько этажей в твоем здании?"

  floors = get_floors
  puts "Создано здание с #{floors} этажами"

  puts "Теперь разберемся с лифтами"
  puts "Сколько их в твоем здании?"
  elevators_count = get_elevators_count
  puts "В здание помещено #{elevators_count} лифтов"

  puts "Теперь параметры лифтов"
  puts "Сколько времени лифт стоит на этаже?"
  waiting_time = get_waiting_time
  if waiting_time > 1
    puts "Создан медленный лифт который стоит на этаже вечность(#{waiting_time} времени)"
  else
    puts "Быстрые лифты помещены в здание"
  end
else
  floors = 16
  elevators_count = 3
  waiting_time = 2
end

world = World.new
building = Building.new(floors, elevators_count, waiting_time)
world.add_building building

world.start



