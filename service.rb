# frozen_string_literal: true

class Service
  attr_reader :str, :vocabulary

  def initialize(str:, vocabulary:)
    @str = str
    @vocabulary = vocabulary
  end

  def call
    length = str.length
    array = Array.new(length + 1, false)
    array[0] = true

    (1..length).each do |i|
      (0...i).each do |j|
        if array[j] && vocabulary.include?(str[j...i])
          array[i] = true
          break
        end
      end
    end

    array[length]
  end
end
