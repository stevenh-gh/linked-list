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

  def prepend(value)
    node = Node.new

    node.value = value

    node.next_node = head

    self.head = node
  end

  def size
    count = 0

    temp = head

    until temp.nil?

      temp = temp.next_node

      count += 1

    end

    count
  end

  def tail
    temp = head.next_node

    temp = temp.next_node until temp.next_node.nil?

    temp
  end

  def to_s
    str = "( #{head.value} )"

    temp = head.next_node

    loop do
      str += temp.nil? ? ' -> nil' : " -> ( #{temp.value} )"

      break if temp.nil?

      temp = temp.next_node
    end

    str
  end
end

list = LinkedList.new
list.head.value = 10
list.append(20)
list.append(30)
list.append(40)
list.prepend(5)
list.prepend(10_000)
list.prepend('head')
p list.to_s
p list.size #=>7 atm
p list.tail
