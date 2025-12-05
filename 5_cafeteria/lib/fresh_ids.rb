# frozen_string_literal: true

# counts fresh ids for elves
class FreshIds
  attr_accessor :pivoting, :checking
  attr_reader :ranges

  def initialize(file_path)
    file = File.read(file_path)

    self.ranges = file.split("\n\n")[0].split("\n").inject([]) do |acc, e|
      acc << e.split('-').map(&:to_i)
    end
  end

  def pivot_checking
    return if bad_pivot_compare?

    if overflow_lower?
      overflow_lower!
    elsif overflow_upper?
      overflow_upper!
    end

    ranges[checking] = nil if contains?
  end

  def clear_nils
    ranges.delete(nil)
  end

  def unique_ranges_ids!
    ranges.each.with_index do |_, i|
      self.pivoting = i

      ranges.each.with_index do |_, j|
        self.checking = j

        pivot_checking
      end
    end

    clear_nils
  end

  private

  attr_writer :ranges

  def contains?
    ranges[checking].first >= ranges[pivoting].first && ranges[checking].last <= ranges[pivoting].last
  end

  def overflow_lower?
    ranges[checking].first < ranges[pivoting].first && Range.new(*ranges[pivoting]).include?(ranges[checking].last)
  end

  def overflow_lower!
    ranges[pivoting] = [ranges[checking].first, ranges[pivoting].last]
  end

  def overflow_upper?
    ranges[checking].last > ranges[pivoting].last && Range.new(*ranges[pivoting]).include?(ranges[checking].first)
  end

  def overflow_upper!
    ranges[pivoting] = [ranges[pivoting].first, ranges[checking].last]
  end

  def bad_pivot_compare?
    ranges[pivoting].nil? || ranges[checking].nil? || pivoting == checking
  end
end
