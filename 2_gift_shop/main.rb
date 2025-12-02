# frozen_string_literal: true

input = File.read('./data/input.txt')

ranges = input.split(',').inject([]) do |acc, range|
  range = range.split('-').map { |number| number.to_i }

  acc << Range.new(*range)
end
