# frozen_string_literal: true

require 'debug'

input = File.read('./data/input.txt')

ranges = input.split(',').inject([]) do |acc, range|
  range = range.split('-').map(&:to_i)

  acc << Range.new(*range)
end

def is_invalid(number)
  (number.length / 2).times do |size|
    checking = number[0..size]
    is_invalid = true

    number.chars.each_slice(size + 1) do |slice|
      unless slice.join == checking
        is_invalid = false
        break
      end
    end

    return true if is_invalid
  end

  false
end

invalid_ids = []

ranges.each do |range|
  range.each do |num|
    invalid_ids << num if is_invalid(num.to_s)
  end
end

puts 'All the invalid IDs showing repeating pattern is this:'
puts invalid_ids
puts "The sum of all invalid ids is #{invalid_ids.sum}"
