# encode: utf-8
#
# Урок__ 14__ — игра Виселица ver 0.3
# Задача 15-4 — Регистронезависимая виселица ver 0.4
# Задача 19-3 — Виселица с обработкой исключений
# Задача 23-6 — Виселица в github
# Задача 53-2 — Gemfile в виселице

class WordReader
  def read_from_file(file_name)
    begin
      f = File.new(file_name,"r:UTF-8")
      lines = f.readlines
      f.close
    rescue SystemCallError => error
      puts "Нет такого файла или каталога: " + error.message
      puts "Попытка запуска игры прекращена."
      exit
    end
    lines.sample.chomp
  end
end
