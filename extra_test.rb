require 'pry'
# Remove all elements from a linked list of integers that have value val.

# Example
# Given: 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6, val = 6
# Return: 1 --> 2 --> 3 --> 4 --> 5

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)

  return head if head.nil?

  if head.val == val
    head = remove_elements(head.next, val)
  else
    head.next = remove_elements(head.next, val)
  end
  return head

end

head = ListNode.new 1
second = ListNode.new 1
head.next = second
third = ListNode.new 2
second.next = third

head_new = remove_elements(head,2)
binding.pry
print head_new.val
until head_new.next.nil? do
  head_new = head_new.next
  print head_new.val
end
puts 



