# frozen_string_literal: true

require 'debug'

ARR = File.foreach('./data/test.txt').with_object([]) do |line, arr|
  arr << line.chomp.each_char.to_a
end

def neighbor_papers(x, y)
  [
    [x - 1, y - 1],
    [x, y - 1],
    [x + 1, y - 1],
    [x + 1, y],
    [x + 1, y + 1],
    [x, y + 1],
    [x - 1, y + 1],
    [x - 1, y]
  ].filter { |pair| pair.none?(&:negative?) && ARR.dig(*pair) == '@' }.size
end

puts neighbor_papers(0, 0)
