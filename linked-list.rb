class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = Node.new
  end

  def append(value)
    node = Node.new

    node.value = value

    temp = head

    temp = temp.next_node until temp.next_node.nil?

    temp.next_node = node
  end
end
