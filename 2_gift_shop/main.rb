# frozen_string_literal: true

input = File.read('./data/input.txt')

ranges = input.split(',').inject([]) do |acc, range|
  range = range.split('-').map { |number| number.to_i }

  acc << Range.new(*range)
end

sum_invalid_ids = ranges.inject(0) do |sum, range|
  range.each do |num|
    string_number = num.to_s
    num_start = string_number.slice!(0..(string_number.length / 2) - 1)

    sum += num if string_number == num_start
  end

  sum
end

puts sum_invalid_ids
