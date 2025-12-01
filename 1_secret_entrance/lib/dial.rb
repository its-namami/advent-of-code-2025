# frozen_string_literal: true

# This class manages Dial and its rotations
class Dial
  attr_reader :value

  def initialize
    self.value = 50
  end

  def rotate_left(times)
    new_value = value - (times % 99)

    self.value = new_value.negative? ? 100 + new_value : new_value
  end

  def rotate_right(times)
    new_value = value + (times % 99)

    self.value = new_value > 99 ? new_value - 100 : new_value
  end

  private

  attr_writer :value
end
