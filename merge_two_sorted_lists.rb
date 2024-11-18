# merge_two_sorted_lists.rb

# Definition for a singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, next_node = nil)
    @val = val
    @next = next_node
  end
end

def merge_two_lists(l1, l2)
  dummy = ListNode.new
  current = dummy
  
  while l1 && l2
    if l1.val < l2.val
      current.next = l1
      l1 = l1.next
    else
      current.next = l2
      l2 = l2.next
    end
    current = current.next
  end
  
  current.next = l1 || l2  # Append the remaining nodes
  dummy.next
end

# Example usage
# Creating two sorted linked lists: 1 -> 2 -> 4 and 1 -> 3 -> 4
l1 = ListNode.new(1, ListNode.new(2, ListNode.new(4)))
l2 = ListNode.new(1, ListNode.new(3, ListNode.new(4)))

result = merge_two_lists(l1, l2)
while result
  print "#{result.val} -> "
  result = result.next
end
puts "nil"
