//Reverse a Linked List

class Node {
    var value : Int
    var next : Node?
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
var node1 = Node(value: 1)
var node2 = Node(value: 3)
var node3 = Node(value: 5)

node1.next = node2
node2.next = node3

var node4 = Node(value: 2)
var node5 = Node(value: 4)
var node6 = Node(value: 6)

node4.next = node5
node5.next = node6

func printNode(_ head: Node?){
    var current  = head
    while let node = current {
        print(node.value,terminator: " -> ")
        current = node.next
    }
    print()
}
func reverseList(_ head: Node?) -> Node? {
    var prev : Node? = nil
    var current = head
    while current != nil {
        var next  = current?.next
        current?.next = prev
        prev = current
        current = next
        
    }
    return prev
}

//Merge Two Sorted Lists
func mergeTwoLists(_ head1: Node?, _ head2: Node?) -> Node? {
    var ptr1 = head1
    var ptr2 = head2
    let ptrResult = Node(value: 0)
    
    var current = ptrResult
    
    while let node1 = ptr1, let node2 = ptr2 {
        if node1.value < node2.value {
            current.next = node1
            ptr1 = node1.next
        } else {
            current.next = node2
            ptr2 = node2.next
        }
        current = current.next!
    }
    
    if ptr1 != nil {
        current.next = ptr1
    } else if ptr2 != nil {
        current.next = ptr2
    }
    
    return ptrResult.next
}

print("List 1:")
printNode(node1)

print("List 2:")
printNode(node4)

// Merge Lists
let mergedNode = mergeTwoLists(node1, node4)

print("Merged List:")
printNode(mergedNode)
