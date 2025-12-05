# frozen_string_literal: true

require 'debug'

input = File.read('./data/input.txt')

ranges, numbers = input.split("\n\n").map { |e| e.split("\n") }

numbers.map!(&:to_i)

sum = numbers.inject(0) do |sum, number|
  ranges.each do |range|
    first, last = range.split('-').map(&:to_i)

    if (first..last).include?(number)
      sum += 1
      break
    end
  end

  sum
end

p sum
