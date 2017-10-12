
class Node
  attr_reader :surname
  attr_accessor :next_node
    #because attr_accessor is called out, you don't need to def a method for surname or next_node
  def initialize(surname)
    @surname = surname
    @next_node = next_node  # next_node is always nil
  end
end

  # def #method
  #   if ___
  #     code
  #   else ---
  #     code
  #   end
  # end

      #testing if calss exists, testing if method exists, testing if code in method works
      #see learn ruby the hardway to figure out set up of files
