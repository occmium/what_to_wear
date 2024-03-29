# encoding: utf-8
# Задача 26-3 — Что надеть?
# Задача 31-5 — Тесты на «Что надеть?»

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/thing'
require_relative 'lib/collection'

puts "Программа, которая рекомендует, как одеться сегодня по погоде."
puts "\nКакая сейчас температура за окном? (можно с минусом)"
temp_on_street = STDIN.gets.to_i

collection = Collection.read_from_path(Dir["#{__dir__}/data/*.txt"], temp_on_street)

puts collection
