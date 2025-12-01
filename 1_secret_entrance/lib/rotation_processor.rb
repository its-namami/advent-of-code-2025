# frozen_string_literal: true

require_relative 'dial'

# This class calculates the password (amount of zeroes of dial value rotating)
class RotationProcessor
  def initialize(file_path)
    self.dial = Dial.new
    self.file_path = file_path
  end

  def password
    File.foreach(file_path).inject(0) do |zeroes, rotation|
      side = rotation.slice!(0)
      number = rotation.to_i

      case side
      when 'L' then zeroes + dial.rotate_left(number)
      when 'R' then zeroes + dial.rotate_right(number)
      end
    end
  end

  private

  attr_accessor :dial, :file_path
end
