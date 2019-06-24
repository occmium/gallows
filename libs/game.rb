# encode: utf-8
#
# Урок__ 14__ — игра Виселица ver 0.3
# Задача 15-4 — Регистронезависимая виселица ver 0.4
# Задача 19-3 — Виселица с обработкой исключений
# Задача 23-6 — Виселица в github

class Game
  def initialize(word)
    @letters = get_letters(word.downcase)
    @word_of_end = word.encode('UTF-8')
    @errors = 0
    @status = 0
    @good_letters = []
    @bad_letters = []
  end

  def get_letters(word)
    word.encode('UTF-8').split("")
  end

  def ask_next_letter
    puts "\nВведите следующую букву"

    letter = ""

    while letter == ""
      letter = STDIN.gets.encode("UTF-8").downcase.chomp
    end

    next_step(letter)
  end

  def next_step(letter)
    return if @status == -1 || @status == 1

    return if @good_letters.include?(letter) || @bad_letters.include?(letter)

    if (@letters.include?(letter)) ||
      (letter == "й" && @letters.include?("и")) ||
      (letter == "и" && @letters.include?("й")) ||
      (letter == "ё" && @letters.include?("е")) ||
      (letter == "е" && @letters.include?("ё"))

      @good_letters << letter

      if letter == "й"
        @good_letters << "и"
      end

      if letter == "и"
        @good_letters << "й"
      end

      if letter == "ё"
        @good_letters << "е"
      end

      if letter == "е"
        @good_letters << "ё"
      end

      if (@letters - @good_letters).empty?
        @status = 1
      else
        @status = 0
      end
    else
      return if (letter == "й" && @bad_letters.include?("и")) ||
        (letter == "и" && @bad_letters.include?("й")) ||
        (letter == "ё" && @bad_letters.include?("е")) ||
        (letter == "е" && @bad_letters.include?("ё"))

      @bad_letters << letter
      @errors +=1

      if @errors > 6
        @status = -1
      end
    end
  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def status
    @status
  end

  def errors
    @errors
  end

  def word_of_end
    @word_of_end
  end
end
