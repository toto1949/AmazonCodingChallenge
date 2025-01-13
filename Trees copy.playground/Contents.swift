class ThreeNode {
    var value : Int
    var left : ThreeNode?
    var right: ThreeNode?
    
    init(value: Int, left: ThreeNode? = nil, right: ThreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

// Maximum Depth of Binary Tree
 func maxDepth(_ root: ThreeNode?) -> Int {
    guard let root  = root else {
        return 0
    }
    let maxLeft = maxDepth(root.left)
    let maxRight  = maxDepth(root.right)
    return 1 + max(maxLeft, maxRight)
}

var node3 = ThreeNode(value: 3)
var node9 = ThreeNode(value: 9)
var node20 = ThreeNode(value: 20)

var node15 = ThreeNode(value: 15)
var node7 = ThreeNode(value: 7)

node20.left = node15
node20.right = node7

node3.left = node9
node3.right = node20

print("Max depth of the tree is: \(String(describing: maxDepth(node3)))")

//Invert Binary Tree
func invertTree(_ root: ThreeNode?) -> ThreeNode? {
    guard let root = root else {
        return nil
    }
    (root.left, root.right) = (invertTree(root.right) , invertTree(root.left))
    return root
}
func printTree(_ root: ThreeNode?){
    guard let root = root else {
        return
    }
    printTree(root.left)
    print(root.value)
    printTree(root.right)
}

print("Original Tree:")
printTree(node3)

let invertedRoot = invertTree(node3)

print("\nInverted Tree:")
printTree(invertedRoot) 
