# frozen_string_literal: true

require 'debug'

number_lines = File.readlines('./data/input.txt')

operator_line = number_lines.slice!(-1)

number_rows = number_lines.each.with_index.with_object([]) do |(number_line, index), numbers|
  numbers[index] = []

  number_line.each_char.inject('') do |number_str, char|
    if char.between?('0', '9')
      number_str + char
    else
      numbers[index] << number_str.to_i unless number_str.empty?
      ''
    end
  end
end

operators = []

operator_line.each_char.inject('') do |operator_str, char|
  if char.between?('*', '+')
    operator_str + char
  else
    operators << operator_str unless operator_str.empty?
    ''
  end
end

solutions = operators.each.with_index.with_object([]) do |(operator, index), solutions|
  numbers = number_rows.inject([]) { |acc, number_row| acc << number_row[index] }

  solutions <<
    case operator
    when '+' then numbers.sum
    when '*' then numbers.inject(1) { |sum, number| number * sum }
    end
end

puts solutions.sum
