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
end
