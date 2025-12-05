# frozen_string_literal: true

require 'debug'

input = File.read('./data/test.txt')

ranges = input.split("\n\n")[0].split("\n").inject([]) { |acc, e| acc << e.split('-').map(&:to_i) }

def pivot_checking(pairs, pivoting, checking)
  if pairs[checking].first >= pairs[pivoting].first && pairs[checking].last <= pairs[pivoting].last
    pairs[checking] = nil
  elsif pairs[checking].first < pairs[pivoting].first && pairs[pivoting].last >= pairs[checking].last
    pairs[pivoting] = [pairs[checking].first, pairs[pivoting].last]
    pairs[checking] = nil
  elsif pairs[checking].last > pairs[pivoting].last && pairs[pivoting].first >= pairs[checking].first
    pairs[pivoting] = [pairs[pivoting].first, pairs[checking].last]
    pairs[checking] = nil
  end
end

# I just have this vague idea in my head, O((n*n)/2). For some reasson.
# Because I know it will definitely get smaller each run.
# And it is inject?
# If we compare two arrays and we see one is completely within another,
# we delete it!
# If we see one is violating upper bounds but lower bounds within
# then we change current upper bound to the one we check
# and remove the one we check cuz it's useless now
# important:  some_method(...) until ranges.none? &:nil?
# roadmap: increase range / make some ranges nil

puts ranges.inspect
puts '-----'
pivot_checking(ranges, 2, 3)
puts ranges.inspect
