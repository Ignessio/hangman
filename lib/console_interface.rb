class ConsoleInterface
  FIGURES =
    Dir["#{__dir__}/../data/figures/*.txt"].
    sort.
    map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def errors_to_show
    @game.errors.join(", ")
  end

  def figure
    return FIGURES[@game.errors_made]
  end

  def get_input
    print "Введите следующую букву:"
    gets[0].upcase
  end

  def print_out
    puts <<~GAMESTATUS
      Слово: #{word_to_show.colorize(:light_blue)}
      #{figure.colorize(:yellow)}

      Ошибки (#{@game.errors_made.to_s.colorize(:red)}): #{errors_to_show.colorize(:red)}
      У вас осталось ошибок: #{@game.errors_allowed}

      GAMESTATUS

      if @game.won?
      puts "Поздравляем, вы выиграли!".colorize(:green)
    elsif @game.lost?
      puts "Вы проиграли. Загаданное слово #{@game.word}.".colorize(:red)
    end
  end

  def word_to_show
    result =
    @game.letters_to_guess.map do |letter|
      if letter.nil?
        "__"
      else
        letter
      end
    end
    result.join(" ")
  end
end

