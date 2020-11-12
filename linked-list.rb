class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = head
  end

  def append(value)
    node = Node.new

    node.value = value

    temp = head

    temp = temp.next_node until temp.next_node.nil?

    temp.next_node = node

    self.tail = node
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

  def at(index)
    return head if index == 0

    idx = 0

    temp = head

    loop do
      return nil if temp.nil? || idx.negative?

      temp = temp.next_node

      idx += 1

      break if idx == index
    end

    temp
  end

  def pop
    back_node = head
    front_node = head.next_node

    until front_node.next_node.nil?

      back_node = front_node
      front_node = front_node.next_node

    end

    back_node.next_node = nil
    end_node = front_node
  end

  def contains?(value)
    temp = head

    until temp.nil?

      return true if temp.value == value

      temp = temp.next_node

    end

    false
  end

  def find(value)
    index = 0

    temp = head

    until temp.nil?

      return index if temp.value == value

      temp = temp.next_node

      index += 1

    end

    nil
  end

  def insert_at(value, index)
    return nil if index > size || index.negative?

    (prepend value; return) if index == 0

    new_node = Node.new

    new_node.value = value

    old_node = at(index)

    new_node.next_node = old_node

    prev_node = at(index - 1)

    prev_node.next_node = new_node
  end

  def remove_at(index)
    return nil if index > size || index.negative?

    node = at index

    (self.head = head.next_node; return) if index == 0

    prev_node = at index - 1

    next_node = at index + 1

    prev_node.next_node = next_node

    node
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
# p list.tail
list.append(20)
list.append(30)
list.append(40)
list.prepend(5)
list.prepend(10_000)
list.prepend('head')
# p list.to_s
# p list.pop
# p list.to_s
# p list.size

# p list.contains?('head')
# p list.contains?(40)
# p list.contains?('none')
# p list.contains?(10_000)

# p list.find('head')
# p list.find(10_000)
# p list.find 40

# p list.at 0
# p list.at 1

# p list.at 6

# p list.at nil
# list.insert_at('newnode', 2)
# p list.to_s

list.insert_at('nnnnnnnnnnn', 0)
list.insert_at('new 777777', 7)
p list.to_s
p list.size

list.remove_at(3)
p list.to_s
p list.size

list.remove_at(0)
p list.to_s
