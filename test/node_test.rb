require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"

class NodeTest < Minitest::Test

  def test_it_exists
    surname = Node.new(surname)
    assert_instance_of Node, surname
  end

  def test_it_has_a_surname
    surname = Node.new("Burke")
    assert_equal "Burke", surname.surname
  end

  def test_it_has_another_node
    next_node = nil
    assert_nil nil, next_node
  end

end
