# frozen_string_literal: true

require 'pry-byebug'

# HashMap class for hashmaps
class HashMap
  attr_accessor :load_factor, :capacity

  def initialize(capacity = 12)
    @load_factor = 0.75
    @capacity = capacity
    @bucket = Array.new(@capacity)
    @counter = 0
  end

  def hash(key)
    hash_code = 0
    key.each_char { |char| hash_code = 31 * hash_code + char.ord }
    hash_code.modulo(@bucket.length)
  end

  def bucket_counter
    @counter += 1
    loop_counter = @bucket.length * @load_factor
    re_hash if @counter >= loop_counter
  end

  def re_hash
    hash_map = entries
    @bucket = Array.new(@bucket.length * 2)
    hash_map.each { |hash| set(hash[0], hash[1]) }
  end

  def set(key, value)
    bucket_counter
    node = Node.new(key, value)
    index = hash(key)
    if @bucket[index].nil?
      @bucket[index] = node
    else
      @bucket[index].append(node)
    end
  end

  def duplicate?(key)
    index = hash(key)
    binding.pry
  end

  def get(key)
    index = hash(key)
    return if @bucket[index].nil?

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
      return nil if answer.nil?

      answer.key == key ? answer.print_key : nil
    end
  end

  def to_s_debug
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

  def node_iterator(node, key)
    answer = node
    if node.key == key
      node.print_key
    else
      until node.next_node && answer.key == key
        node = node.next_node
        answer = node
      end
      answer.print_key
    end
  end

  def remove(key)
    if has?(key) == false
      nil
    else
      index = hash(key)
      node = @bucket[index]
      p node_iterator(node, key)
      node.data = nil
      node.key = nil
    end
  end

  def print_load_factor
    @bucket
  end

  def length
    length = 0
    temp_length = 0
    @bucket.each do |bucket|
      next if bucket.nil?

      temp_length = bucket
      while temp_length.next_node
        length += 1
        temp_length = temp_length.next_node
      end
      length += 1 if bucket.key
    end
    length
  end

  def clear
    @bucket.clear
  end

  def keys_values(variable)
    array = []
    @bucket.each do |bucket|
      next if bucket.nil?

      array << bucket.public_send(variable)
      if bucket.next_node
        temp_bucket = bucket
        while temp_bucket.next_node
          array << temp_bucket.next_node.public_send(variable)
          temp_bucket = temp_bucket.next_node
        end
      end
    end
    array
  end

  def keys
    keys_values('key')
  end

  def values
    keys_values('data')
  end

  def entries
    array = []
    @bucket.each do |bucket|
      next if bucket.nil?

      array << [bucket.key, bucket.data]
      if bucket.next_node
        temp_bucket = bucket
        while temp_bucket.next_node
          array << [temp_bucket.next_node.key, temp_bucket.next_node.data]
          temp_bucket = temp_bucket.next_node
        end
      end
    end
    array
  end

  def calculate_capacity
    p values.length / @bucket.length
  end

  def i_love_pry
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
    return if node.key == @key

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
abc.set('poppy', 'head')
abc.i_love_pry
