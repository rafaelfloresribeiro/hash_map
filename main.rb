# frozen_string_literal: true

require 'pry-byebug'

# HashMap class for hashmaps
class HashMap
  attr_accessor :load_factor, :capacity

  def initialize
    @load_factor = 0.75
    @capacity = 31
    @bucket = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code.modulo(@capacity)
  end

  def set(key, value)
    index = hash(key) & @buckets.size
    bucket = @bucket[index]
    p key
    node = Node.new(value)
  end
end

#   raise IndexError if index.negative? || index >= @buckets.length

# Node class for hash_map
class Node
  attr_accessor :data, :next_node

  def initialize(data)
    self.data = data
    @next_node = nil
  end
end

abc = HashMap.new
p abc.set('batata', 'carne')
