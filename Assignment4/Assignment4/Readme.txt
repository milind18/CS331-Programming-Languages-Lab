Name: Milind B Prabhu
Roll: 180101091
Assignment 4: Programming Languages Lab

Files included: submission.hs
Description: The file contains the answers (code) for questions A,B,C.

Steps to execute the code on a linux machine:
1. Navigate to the folder containing submission.hs via the terminal. 
2. Next run the following commands from the terminal:
$ ghc --make submission.hs
$ ./submission

3. The following sample input maybe supplied to the program.
(More test cases and their outputs have been provided for each function as comments in submission.hs)
Sample Input:
100,50,60,20,200,150

LCM of the numbers is 600.
The BST created will be:

                100
               /   \
              50    200
	     /  \   /
            20  60  150

Inoder: 20,50,60,100,150,200
Preorder: 100,50,20,60,200,150
Postorder: 20,60,50,150,200,100
