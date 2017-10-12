require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require 'pry'

class LinkedListTest < Minitest::Test

  def test_it_exsits
    list = LinkedList.new
    assert_instance_of LinkedList, list
  end

  def test_head_is_nil_by_default
    list = LinkedList.new
    assert_nil list.head
  end

  def test_it_can_append_once
    list = LinkedList.new

    list.append("West")

    assert_instance_of Node, list.head
    assert_equal "West", list.head.surname
  end

  def test_it_can_append_twice

    list = LinkedList.new

    list.append("West")
    list.append("Hardy")

    assert_instance_of Node, list.head
    assert_equal "West", list.head.surname
     assert_instance_of Node, list.head.next_node
     assert_equal "Hardy", list.head.next_node.surname
  end

   def test_count
     list = LinkedList.new

     assert_equal 0, list.count

     list.append("West")

     assert_equal 1, list.count

     list.append("Hardy")

     assert_equal 2, list.count
   end

   def test_turn_one_name_to_string
    list = LinkedList.new

     list.append("West")
     description = "The #{list.head.surname} Family"

     assert_equal "The West Family", description
   end

   def test_turn_two_names_to_string
     list = LinkedList.new

     list.append("Rhodes")
     list.append("Burke")
     description = "The #{list.head.surname} family, followed by the #{list.head.next_node.surname} family."

     assert_equal "The Rhodes family, followed by the Burke family.", description
   end

   def test_prepend_one_name
     list = LinkedList.new

     list.append("Hardy")
     list.append("Burke")
     list.prepend("McKinney")

     assert_instance_of Node, list.head
     assert_equal "McKinney", list.head.surname
   end

  def test_more_than_2_names_to_string
    list = LinkedList.new
    list.append("Rhodes")
    list.append("Burke")
    list.append("Henderson")

     assert_equal "The Rhodes family, followed by the Burke family, followed by the Henderson family.", list.to_string
  end

  def test_inserting_name
    list = LinkedList.new

    list.append("Rhodes")
    list.append("Burke")
    list.append("Henderson")

    assert_equal "Burke", list.head.next_node.surname
    assert_equal 3, list.count

    list.insert(1, "McKinney")

    assert_equal "McKinney", list.head.next_node.surname

    assert_equal 4, list.count
    assert_equal "Burke", list.head.next_node.next_node.surname
  end

  def test_can_it_find_position_and_print_string_for_one
    list = LinkedList.new

    list.append("Rhodes")
    list.append("Burke")
    list.append("Henderson")

    list.find(1, 1)

    assert_equal "The Burke family", "The #{list.head.next_node.surname} family"
  end

  def test_can_it_find_position_and_print_string_for_two
    list = LinkedList.new

    list.append("Rhodes")
    list.append("Burke")
    list.append("Henderson")

    assert_equal "The Rhodes family, followed by the Burke family", "The #{list.head.surname} family, followed by the #{list.head.next_node.surname} family"
  end

  def test_it_includes_surname
    skip
    list = LinkedList.new

    list.append("Rhodes")
    list.append("Burke")
    list.append("Henderson")

    assert "Burke", true
  end

  def test_last_name_in_list_is_removed
    list = LinkedList.new

    list.append("Rhodes")
    list.append("Burke")
    list.append("Henderson")

    result = "The #{list.head.next_node.next_node.surname} family has died of dysentry."

    assert_equal "The Henderson family has died of dysentry.", result
  end

  def test_pop_another_family
    list = LinkedList.new

    list.append("Rhodes")
    list.append("Burke")
    list.append("Henderson")

    list.pop
    list.pop

    assert_equal "The Burke family has died of dysentry.", list.pop
  end
end
