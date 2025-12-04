# frozen_string_literal: true

require 'debug'
require 'pp'

ARR = File.foreach('./data/input.txt').with_object([]) do |line, arr|
  arr << line.chomp.each_char.to_a
end

def neighbor_rolls(y, x)
  [
    [x - 1, y - 1],
    [x, y - 1],
    [x + 1, y - 1],
    [x + 1, y],
    [x + 1, y + 1],
    [x, y + 1],
    [x - 1, y + 1],
    [x - 1, y]
  ].filter { |pair| pair.none?(&:negative?) && ARR.dig(*pair.reverse) == '@' }.size
end

qualified = ARR.each.with_object([]).with_index do |(arr, qualified), y|
  arr.each.with_index do |elm, x|
    qualified << [x, y] if elm == '@' && neighbor_rolls(y, x) < 4
  end
end

pp qualified.size
