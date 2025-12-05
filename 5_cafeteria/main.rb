# frozen_string_literal: true

require 'debug'

require_relative 'lib/fresh_ids'

ids = FreshIds.new('./data/input.txt')

# wtf??? why does it work only with the second loop?
2.times { ids.unique_ranges_ids! }

sum = ids.ranges.inject(0) do |sum, range|
  range.last - range.first + 1 + sum
end

puts sum
