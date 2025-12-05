# frozen_string_literal: true

require 'debug'

input = File.read('./data/input.txt')

ranges = input.split("\n\n")[0].split("\n")

sum = ranges.each.with_object([]) do |range, unique_ranges|
  first, last = range.split('-').map(&:to_i)

  (first..last).each do |number|
    unique_ranges << number unless unique_ranges.include?(number)
  end
end

puts sum.size
