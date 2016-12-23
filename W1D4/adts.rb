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
