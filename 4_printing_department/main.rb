# frozen_string_literal: true

require 'debug'
require 'pp'

ARR = File.foreach('./data/input.txt').with_object([]) do |line, arr|
  arr << line.chomp.each_char.to_a
end.freeze

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

def qualified
  ARR.each.with_object([]).with_index do |(arr, qualified_arr), y|
    arr.each.with_index do |elm, x|
      qualified_arr << [y, x] if elm == '@' && neighbor_rolls(y, x) < 4
    end
  end
end

def enxify(to_add)
  to_add.each { |position| ARR[position.first][position.last] = 'X' }
end

def iterate_enxify
  to_add = qualified

  return ARR if to_add.empty?

  enxify(to_add)

  iterate_enxify
end

pp iterate_enxify.flatten.count('X')
