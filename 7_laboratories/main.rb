# frozen_string_literal: true

require 'debug'

file_lines = File.read('./data/input.txt').split("\n")

beams = [file_lines.slice!(0).index('S')]
line_length = file_lines[0].length

times_split = file_lines.inject(0) do |times_split, line|
  splitters = line.each_char.to_a.filter_map.with_index { |e, i| i if e == '^' }

  new_times_split = 0
  new_beams = (splitters & beams).each.with_object([]) do |split, new_beams|
    beams.delete split

    new_times_split += 1

    if split.zero?
      new_beams << split + 1
    else
      new_beams << split - 1
      new_beams << split + 1 if split < line_length
    end
  end

  if new_beams.empty?
    times_split
  else
    new_beams.uniq!
    beams += new_beams

    times_split + new_times_split
  end
end

puts times_split
