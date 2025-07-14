# frozen_string_literal: true

require 'pry-byebug'

# HashMap class for hashmaps
class HashMap
  attr_accessor :load_factor, :capacity

  PRIME_FACTOR = 31

  def initialize
    @load_factor = 0.75
    @capacity = 31
    @bucket = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    key.each_char { |char| hash_code = PRIME_FACTOR * hash_code + char.ord }
    hash_code.modulo(@capacity)
  end

  def set(key, value)
    node = Node.new(key, value)
    index = hash(key)
    if @bucket[index].nil?
      @bucket[index] = node
    else
      @bucket[index].append(node)
    end
  end

  def get(key)
    index = hash(key)
    validation = @bucket[index] unless @bucket[index].nil?
    until validation.next_node.nil?
      if validation.key == key
        return validation
      else
        return validation = validation.next_node
      end
      nil
    end
  end

  def pry_byebug
    binding.pry
  end
end

#   raise IndexError if index.negative? || index >= @buckets.length

# Node class for hash_map
class Node
  attr_accessor :data, :key, :next_node

  def initialize(key, data)
    self.data = data
    self.key = key
    @next_node = nil
  end

  def append(node)
    self.next_node = node
  end
end

abc = HashMap.new
abc.set('apple', 'red')
abc.set('banana', 'yellow')
abc.set('carrot', 'orange')
abc.set('dog', 'brown')
abc.set('elephant', 'gray')
abc.set('frog', 'green')
abc.set('grape', 'purple')
abc.set('hat', 'black')
abc.set('ice cream', 'white')
abc.set('jacket', 'blue')
abc.set('kite', 'pink')
abc.set('lion', 'golden')
p abc.get('kite')
p abc.get('apple')
p abc.get('fantasma')
