-- Definition of the new binary search tree
-- It can either be a "Nil" element or an element with a value, left and right children
data BST a  = Nil | Element (BST a) a (BST a)    
    deriving (Ord, Eq, Show)

-- Function to insert an element into the binary search tree.
insertBST :: Ord a => BST a-> a -> BST a
insertBST Nil x = Element (Nil) x (Nil)
insertBST (Element (left) value (right)) x
    | x < value = Element (insertBST left x) value (right)
    | x >= value = Element (left) value (insertBST right x)

--Function to insert all the elements in a list into a binary search tree
insertList :: Ord a => BST a -> [a] -> BST a
insertList tree [] = tree
insertList tree (x:xs) = insertList (insertBST tree x) xs

--Function which stores the inorder sequence of the BST in a list
inorderTraversal :: Ord a => BST a -> [a]
inorderTraversal Nil = []
inorderTraversal (Element (left) value (right)) = (inorderTraversal left) ++ [value] ++ (inorderTraversal right)

--Function which stores the pretorder sequence of the BST in a list
preorderTraversal :: Ord a => BST a -> [a]
preorderTraversal Nil = []
preorderTraversal (Element (left) value (right)) = [value] ++ (preorderTraversal left)  ++ (preorderTraversal right)

--Function which stores the postorder sequence of the BST in a list
postorderTraversal :: Ord a => BST a -> [a]
postorderTraversal Nil = []
postorderTraversal (Element (left) value (right)) =  (postorderTraversal left)  ++ (postorderTraversal right) ++ [value]

input = [100,200,1,2,1000,13]

main = 
    do 
        let 
            x = Nil
            y = (insertList x input)
            inorderY = inorderTraversal y
            preorderY = preorderTraversal y
            postorderY = postorderTraversal y
        putStrLn "Input"
        print input

        putStrLn "\n\nInorder Traversal: " 
        print inorderY
        putStrLn "\nPreorder Traversal" 
        print preorderY
        putStrLn "\nPostorder Traversal"
        print postorderY

        

