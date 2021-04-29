
-- This function replaces all occurrences of commas with spaces. Ex: "1,2,3" -> "1 2 3"
replace :: String -> String
replace (',':xs) = ' ': replace xs
replace(x:xs) = x : replace xs
replace "" = ""

main = 
    do
        putStrLn "Enter the numbers: "
        num <- getLine
        -- First replace all the commas in the input string with spaces.
        -- Next use the words function to break the string into a list of strings. Ex "1 2 3" -> ["1","2","3"]
        -- Convert the strings to integers using by mapping the read function on to the created list. Ex ["1","2","3"] -> [1,2,3]
        let l = map (read:: String -> Int) (words $ replace num)
        print l



