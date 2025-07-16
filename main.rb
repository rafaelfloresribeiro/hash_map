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
    answer = nil
    if validation.key == key
      validation.print_key
    else
      until validation.next_node.nil?
        if validation.key == key
          validation.print_key
          return answer.print_key
        else
          validation = validation.next_node
          answer = validation
        end
      end
      answer.print_key
    end
  end

  def to_s
    @bucket.each { |line| p line unless line.nil? }
  end

  def has?(key)
    index = hash(key)
    validation = @bucket[index]
    while validation.next_node
      return true if validation.key == key

      validation = validation.next_node
    end
    validation.key == key
  rescue NoMethodError
    false
  end

  def print_load_factor
    @bucket
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
    if @next_node.nil?
      self.next_node = node
    else
      @next_node.append(node)
    end
  end

  def print_key
    [@key, @data]
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
# p abc.get('grape')
# p abc.get('apple')
# p abc.get('kite')
p abc.has?('apple')
p abc.has?('banana')
p abc.has?('carrot')
p abc.has?('dog')
p abc.has?('ice cream')
p abc.has?('su123132')
p abc.has?('rafael ffff')
p abc.has?('as casdw w')
