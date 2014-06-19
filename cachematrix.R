## To the evaluators of this code for programming assignment #2 in the Coursera 
## Programming in R course taught by Prof. Peng:
##
## SUMMARY
## The code below consists of several statements the user executes in R in the 
## user's work environment. The purpose of creating the two fuctions is to efficiently 
## retrieve the inverse of a matrix by asking R to only calculate the inverse of 
## the matrix once, then retrieve the cached value of the inverse when needed multiple 
## times. This is a technique to be used when the underlying matrix is not expected 
## to change later in the code, and relies on lexical scoping rules of R.
##
## Evaluators, for clarity, please clear your Global Environment of variables, values 
## and functions before proceeding to evaluate this code. Thanks!
##
## First, the user needs to have a matrix loaded into the user's workspace. I found 
## the follow example matrix on a web page attributed to John Myles White with the 
## title "Quick Review of Matrix Algebra in R". It will not cause an error to ocurr 
## later when the code calls solve() on the matrix.
##
## Please run the following line of code in R now to load the matrix into your workspace:
##
y <- matrix(c(0, 2, 1, 0), nrow=2, ncol=2, byrow=TRUE)
##
## The variable y in the user's workspace is now assigned the value of this 2 x 2 matrix:
##
##      [,1] [,2]
## [1,]    0    2
## [2,]    1    0
##
## The following function makeCacheMatrix() is based on the code example Prof. Peng 
## provided for the efficently getting the mean of a matrix.  Here, the function 
## returns a list of functions, which the user can later pass to the function cacheSolve().
##
## Please run the following lines of code to load the makeCacheMatrix function into your workspace:
##
makeCacheMatrix <- function(x = matrix()) {  ## here, you will pass your matrix into the x argument
}               
##
## The function cacheSolve(x) below, will return the inverse of a matrix by calculating 
## the inverse of the matrix, which was first passed to the makeCacheMatrix() function. 
## The first time cacheSolve() is called, the function asks R to calculate the inverse 
## of the matrix using the solve() function, which is the single value 0.75. When calling 
## the function again, the inverse of the maxtix is retrieved from the cache and a message
## is printed "getting cached data" followed by the cached value 0.75.
##
## Please run the following lines of code for the function cacheSolve, to load it into 
## your workspace.
##
cacheSolve <- function(x, ...) { ## here, you will pass your list of functions returned by 
                                 ## the makeCacheMatrix function as the argment x of this function
        
        ##  Return a matrix that is the inverse of matrix
}
##
## Please run the following line of code, which calls the function makeCacheMatrix on the matrix 
## in your workspace:
##
theFunctionList <- makeCacheMatrix(y)  ## the variable theFunctionList in the user's workspace now contains 
                                       ## a list of functions to be called later
##
## Now run the following line of code in R.  It will return the value of the inverted matrix
##
cacheSolve(theFunctionList)
##
## The expected output of this example is the following:
##      [,1] [,2]
## [1,]  0.0    1
## [2,]  0.5    0
##
## Now run the same line of code again, as shown here:
##
cacheSolve(theFunctionList)
## 
## this time the expected output is:
## getting cached data
##      [,1] [,2]
## [1,]  0.0    1
## [2,]  0.5    0





