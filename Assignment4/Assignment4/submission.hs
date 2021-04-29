-- Question A
-- This function replaces all occurrences of commas with spaces. 
--Test case: replace "1,2,3" => "1 2 3"
replace :: String -> String
replace (',':xs) = ' ': replace xs
replace(x:xs) = x : replace xs
replace "" = ""


--Question B
-- Given a pair of numbers, compute the greatest common divisor of the numbers.
--Test case: greatestCommonDivisor 100 150 => 50
greatestCommonDivisor :: Int -> Int -> Int
greatestCommonDivisor a 1 = 1
greatestCommonDivisor a b
    | a `mod` b == 0  = b
    | otherwise = greatestCommonDivisor b (a `mod` b)

-- Given a pair of numbers compute their least common multiple. 
-- Uses the following fact: lcm(a,b) * gcd(a,b) = a*b
-- Test case: leastCommonMultiple 100 150 => 300
leastCommonMultiple :: Int -> Int -> Int
leastCommonMultiple a b = (a*b) `div` (greatestCommonDivisor a b)

-- The function computes the LCM of all the numbers given in the list.
-- Test case: lcmList [3,10,14] => 210
lcmList :: [Int] -> Int
lcmList [] = 0
lcmList [a] = a
lcmList (x:y:xs) = lcmList( (leastCommonMultiple x y) : xs) 


--Question C
-- Definition of the new binary search tree
-- It can either be a "Nil" element or an element with a value, left and right children
data BST a  = Nil | Element (BST a) a (BST a)    
    deriving (Ord, Eq, Show)

-- Function to insert an element into the binary search tree.
-- Test case: insertBST Nil 10 => Element Nil 10 Nil
insertBST :: Ord a => BST a-> a -> BST a
insertBST Nil x = Element (Nil) x (Nil)
insertBST (Element (left) value (right)) x
    | x < value = Element (insertBST left x) value (right)
    | x >= value = Element (left) value (insertBST right x)

--Function to insert all the elements in a list into a binary search tree
-- Test case: insertBST Nil [10,20,5] => Element (Element Nil 5 Nil) 10 (Element Nil 20 Nil)
insertList :: Ord a => BST a -> [a] -> BST a
insertList tree [] = tree
insertList tree (x:xs) = insertList (insertBST tree x) xs

--Function which stores the inorder sequence of the BST in a list
-- Test case: y = insertList Nil [10,20,5]
-- inorderTraversal y => [5,10,20]
inorderTraversal :: Ord a => BST a -> [a]
inorderTraversal Nil = []
inorderTraversal (Element (left) value (right)) = (inorderTraversal left) ++ [value] ++ (inorderTraversal right)


--Function which stores the pretorder sequence of the BST in a list
--Test case: y = insertList Nil [10,20,5]
-- preorderTraversal y => [10,5,20]
preorderTraversal :: Ord a => BST a -> [a]
preorderTraversal Nil = []
preorderTraversal (Element (left) value (right)) = [value] ++ (preorderTraversal left)  ++ (preorderTraversal right)

--Function which stores the postorder sequence of the BST in a list
--Test case: y = insertList Nil [10,20,5]
-- postorderTraversal y => [5,20,10]
postorderTraversal :: Ord a => BST a -> [a]
postorderTraversal Nil = []
postorderTraversal (Element (left) value (right)) =  (postorderTraversal left)  ++ (postorderTraversal right) ++ [value]


main = 
    do
        --Question A
        putStrLn "\nQuestion A: \n"
        putStrLn "Enter the numbers: "
        num <- getLine
        -- First replace all the commas in the input string with spaces.
        -- Next use the words function to break the string into a list of strings. Ex "1 2 3" -> ["1","2","3"]
        -- Convert the strings to integers using by mapping the read function on to the created list. Ex ["1","2","3"] -> [1,2,3]
        let input = map (read:: String -> Int) (words $ replace num)
        putStrLn "\nThe input is : "
        print input

        --Question B
        putStrLn "\nQuestion B: "
        let lcm = lcmList input
        putStrLn("The least common multiple of the list is: ")
        print lcm

        --Question C
        let 
            --Create the binary search tree using the list
            y = (insertList Nil input)
            inorderY = inorderTraversal y
            preorderY = preorderTraversal y
            postorderY = postorderTraversal y
        putStrLn "\nQuestion C: "
        putStrLn "Inorder Traversal: " 
        print inorderY
        putStrLn "\nPreorder Traversal" 
        print preorderY
        putStrLn "\nPostorder Traversal"
        print postorderY
