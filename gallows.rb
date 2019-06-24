# encode: utf-8
#
# Урок__ 14__ — игра Виселица ver 0.3
# Задача 15-4 — Регистронезависимая виселица ver 0.4
# Задача 19-3 — Виселица с обработкой исключений
# Задача 23-6 — Виселица в github

require_relative "libs/game"
require_relative "libs/result_printer"
require_relative "libs/word_reader"

current_path = File.dirname(__FILE__)

printer = ResultPrinter.new
reader = WordReader.new
word = reader.read_from_file(current_path + "/data/words.txt")
game = Game.new(word)

while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
sleep 2