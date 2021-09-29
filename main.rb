if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/console_interface"
require_relative "lib/game"

puts "Приветствуем вас, игрок!"
puts "Попробуйте угадать слово задавая по одной букве."

# считываем случайную строку из файла и записываем её в переменную
word = File.readlines("#{__dir__}/data/words.txt", chomp: true, encoding: "utf-8").sample

# создаем новый экземпляр игры и передаем ему слово в строке
game = Game.new(word)
# создаем новый экземпляр консольного интерфейса, которому передаем экземпляр игры
console_interface = ConsoleInterface.new(game)

# пока идет игра
until game.over?
  # командуем консольному интерфейсу, чтобы вывел текущее состояние
  console_interface.print_out
  # командуем консольному интерфейсу, чтобы запросил букву и записываем её в переменную
  letter = console_interface.get_input
  # передаем эту букву в переменной экземпляру игры и заставляем его запустить обсчет данных
  game.play!(letter)
end
# когда всё кончено, командуем консольному интерфейсу вывести последние данные
console_interface.print_out
