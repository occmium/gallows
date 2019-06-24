# encode: utf-8
#
# Урок__ 14__ — игра Виселица ver 0.3
# Задача 15-4 — Регистронезависимая виселица ver 0.4
# Задача 19-3 — Виселица с обработкой исключений
# Задача 23-6 — Виселица в github

class ResultPrinter
  def initialize
    @status_image = []
    @error_sys = []

    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7 do
      file_name = current_path + "/../image/#{counter}.txt"

      begin
        f = File.new(file_name,"r:UTF-8")
        @status_image << f.read
        f.close
      rescue Errno::ENOENT => error
        @error_sys << error.message
        @status_image << "\n[НЕТ КАРТИНКИ]\n\n"
      end

      counter += 1
    end
  end

  def print_status(game)
    cls

    if @error_sys.empty?
    else
      puts "\n#{@error_sys.join("\n")}\n\nПри отображении графики могут возникуть проблемы!"
    end

    puts "\nСлово: #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(" ")}"

    print_gibbet(game.errors)

    if game.errors >= 7
      puts "Вы исчерпали количество попыток!"
      puts "Было загадано слово: #{game.word_of_end}"
    else
      if (game.letters - game.good_letters).empty?
        puts "Поздравляем, вы отгадали!\n\n"
      else
        puts "У вас осталось попыток: " + (7 - game.errors).to_s
      end
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""

    letters.each {|item|
      if good_letters.include?(item)
        result += item + " "
      else
        result += "__ "
      end
    }

    result
  end

  def cls
    system("cls") || system("clear")
  end

  def print_gibbet(errors)
    puts @status_image[errors]
  end
end
