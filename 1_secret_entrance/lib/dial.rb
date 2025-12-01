# frozen_string_literal: true

# This class manages Dial and its rotations
class Dial
  attr_reader :value

  def initialize
    self.value = 50
  end

  # rotate functions return times they ever had 0

  def rotate_left(times)
    new_value = value - (times % 100)
    zeroes_passed = times / 100

    zeroes_passed += 1 if new_value <= 0 && value.positive?

    self.value = if new_value.negative?
                   new_value + 100
                 else
                   new_value
                 end

    zeroes_passed
  end

  def rotate_right(times)
    new_value = value + (times % 100)

    zeroes_passed = times / 100

    if new_value > 99
      self.value = new_value - 100
      zeroes_passed + 1
    else
      self.value = new_value
      zeroes_passed
    end
  end

  private

  attr_writer :value
end
