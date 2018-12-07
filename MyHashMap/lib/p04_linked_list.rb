class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |node| return node.val if node.key == key }
  end

  def include?(key)
    each do |node|
      if node.key == key
        return true
      end
    end 
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    second_to_last = last 

    second_to_last.next = new_node
    new_node.prev = second_to_last
    new_node.next = @tail
    @tail.prev = new_node 
  end

  def update(key, val)
    each do |node|
      if node.key == key 
        node.val = val
      end
    end
  end

  def remove(key)
    each do |node| 
      if node.key == key
        previous = node.prev
        next_node = node.next 

        previous.next, next_node.prev = next_node, previous 
        break
      end
    end
  end

  def each
    curr = @head.next

    until curr == @tail
      yield curr
      curr = curr.next 
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
