class Stack # LIFO
  attr_reader :stack

  def initialize
    @stack = []
  end

  def add(el)
    stack.push(el)
  end

  def remove
    stack.pop
    show
  end

  def show
    stack
  end
end

class Queue # FIFO
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue.push(el)
  end

  def dequeue
    queue.shift
    show
  end

  def show
    queue
  end
end

class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def assign(key, value)
    map.each do |pair|
      if pair.include?(key)
        pair[1] = value
        return pair
      end
    end
    map << [key, value]
  end

  def lookup(key)
    map.each do |pair|
      return pair[1] if pair[0] == key
    end
  end

  def remove(key)
    map.delete_if { |pair| pair[0] == key }
  end

  def show
    map
  end
end
