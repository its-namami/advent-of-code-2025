# frozen_string_literal: true

def add_joltage(joltage, sorted_pair)
  [sorted_pair.last, joltage] if sorted_pair.first < joltage
end

pairs_array = File.foreach('./data/input.txt').with_object([]) do |line, pairs|
  pairs << line.chomp.each_char.with_object(%w[0 0]) do |joltage, pair|
    sorted_pair = pair.last > pair.first ? ['/', pair.last] : pair.dup.sort
    new_pair = add_joltage(joltage, sorted_pair)

    pair.replace(new_pair) if new_pair
  end
end

arrays_sum = pairs_array.map { |pair| pair.join.to_i }.sum

puts arrays_sum
