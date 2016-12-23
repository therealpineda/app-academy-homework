class Stack
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
