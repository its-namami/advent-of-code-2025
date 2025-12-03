# frozen_string_literal: true

def remove_smallest(joltages)
  possibilities = []

  joltages.each.with_index do |_, index|
    new_posssibility = joltages.dup
    new_posssibility.delete_at(index)
    possibilities << new_posssibility
  end

  possibilities.max
end

pairs_array = File.foreach('./data/input.txt').with_object([]) do |line, arrs|
  arrs << line.chomp.each_char.with_object([]) do |joltage, battery|
    battery << joltage

    next unless battery.size > 12

    battery.replace(remove_smallest(battery))
  end
end

arrays_sum = pairs_array.map { |pair| pair.join.to_i }

puts arrays_sum.sum
