# frozen_string_literal: true

require 'debug'

require_relative 'lib/rotation_processor'

puts RotationProcessor.new('./data/rotations.txt').password
