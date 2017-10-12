require 'pry'
require './lib/node'

class LinkedList
attr_reader :head

  def initialize
    @head = nil
  end

  def append(surname)
    if @head.nil?
       @head = Node.new(surname)
    else
      current = @head
      until current.next_node.nil?
        current = current.next_node
      end
      current.next_node = Node.new(surname)
    end
  end

  def prepend(surname)
    @head = Node.new(surname)
  end

  def count
    @head.nil?
    count = 0
    current = @head

    until current.nil?
      current = current.next_node
      count += 1
    end

      count
  end

  def to_string
    string = "The #{head.surname} family"

    if @head.next_node.nil?
      string += "."
    end

    current = @head.next_node

    until current.nil?
      string += ", followed by the #{current.surname} family"
      if current.next_node.nil?
        string += "."
      end
      current = current.next_node
    end
    string
  end

  def insert(position, surname)
    count = 1
    current = @head

    until count == position
      count += 1
      current = current.next_node
    end

    previous_nodes = current.next_node #to save any values you need to assign them to a variable
    current.next_node = Node.new(surname) #creating new node to be put into position provided by counter-- ie 1 would be the next_node after head.
    current.next_node.next_node = previous_nodes #adding the nodes we saved back onto the new list
  end

  def find(position, instance)
    count = 0
    current = @head

    until count == position
      count += 1
      current = current.next_node
    end

    string = "The #{current.surname} family"

    if instance == 1
      string
    else
      string +", followed by the #{current.next_node.surname} family"
    end
  end

  def includes?(surname)
  end

  def pop
    current = @head

    until current.next_node.nil?
      current = current.next_node
    end
    current = current.next_node

    "The #{current.surname} family has died of dysentry."

    current = current.next_node
  end
end
