# frozen_string_literal: true

require 'debug'

require_relative 'lib/dial'

dial = Dial.new

dial.rotate_right 100

puts dial.value
