# frozen_string_literal: true

file_lines = File.read('./data/input.txt').split("\n")

line_length = file_lines[0].length
beams = Array.new(line_length, 0)
beams[file_lines.slice!(0).index('S')] = 1

file_lines.each do |line|
  splitters = line.each_char.to_a.filter_map.with_index { |e, i| i if e == '^' }

  splitters.each do |split|
    beam_val = beams[split]
    beams[split] = 0

    if split.zero?
      beams[split + 1] += beam_val
    else
      beams[split - 1] += beam_val
      beams[split + 1] += beam_val if split < line_length
    end
  end
end

puts beams.sum
