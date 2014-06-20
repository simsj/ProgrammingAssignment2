## To the evaluators of this code for programming assignment #2 in the Coursera 
## Programming in R course taught by Prof. Peng:
##
## SUMMARY
## The code below consists of several statements the user executes in R in the 
## user's work environment. The purpose of creating the two fuctions is to efficiently 
## retrieve the inverse of a matrix by asking R to only calculate the inverse of 
## the matrix once, then retrieve the cached value of the inverse when needed multiple 
## times later. This is a technique to be used when the underlying matrix is not expected 
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
makeCacheMatrix <- function(x = matrix()) {  ## here, you will pass your matrix y into the x argument
        v <- NULL   ## in this function's environment, the variable v is assigned the value of NULL
                    ## v is the variable that contains the inverse of the matrix or it is NULL
                    ##
        set <- function(y) { 
                v <<- NULL    ## the variable v in the parent.environment is set to NULL
                
                x <<-  y      ## this sets the variable x in the parent.enviornment to the value y 
                              ## which is passed into this function as a formal argument; in other words
                              ## x is a copy of the original matrix y
        }
                              ##
        get <- function() x   ## a function to fetch a copy of the y matrix passed into 
                              ## makeCacheMatrix as a formal argument
                              ##
        setinverse <- function(solve) v <<- solve ## sets the variable v in the parent.enviornment 
                                                  ## to the matrix inverse
                              ##
        getinverse <- function() v  ## a function to fetch the inverse of the matrix 
                              ##
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse) ## a list of four functions 
                                                                                     ## and function variable names
                                                                                     ## returned by the function 
                                                                                     ## makeCacheMatrix
}
##
## Now call the makeCacheMatrix function on the matrix y and assign the function list, 
## which is returned by the function to the variable theFunctionList by running the 
## following line of code:
##
theFunctionList <- makeCacheMatrix(y) 
##
##
## If you wish to see the full list of functions and function names returned by makeCacheMatrix (optional here), you can 
## ask R to print the list by running the following line of code:
##
theFunctionList
##
## the expected contents of theFunctionList should look something like this:
# $set
# function (y) 
# {
#         v <<- NULL
#         x <<- y
# }
# <environment: 0x7fad31799030>
#         
#         $get
# function () 
#         x
# <environment: 0x7fad31799030>
#         
#         $setinverse
# function (solve) 
#         v <<- solve
# <environment: 0x7fad31799030>
#         
#         $getinverse
# function () 
#         v
# <environment: 0x7fad31799030>
##
##
## The function cacheSolve below will return the inverse of a matrix by calculating 
## the inverse of the matrix which was first passed to the makeCacheMatrix() function. 
## Please run the following lines of code for the function cacheSolve, to load it into 
## your workspace.
##
cacheSolve <- function(x, ...) { ## here, you will pass the list of functions returned by 
                                 ## the makeCacheMatrix function as the argment x of this function
        v <- x$getinverse()      ## this calls the getinverse function
                                 ##
        if(!is.null(v)) {                
                message("getting cached data")      ## this if statement returns the cached value of v if v is not NULL          
                return(v)        }                  ## function execution halts here when v is not NULL
                                ##
        data <- x$get()         ## v was NULL; this calls the get fuction and assigns the matrix to the variable data 
        v <- solve(data, ...)   ## this calculates the inverse of the matrix by calling solve() on the matrix in the 
                                ## variable data 
        x$setinverse(v)         ## this causes the setinverse function to be called on v    
        v                       ## this function returns freshly calculated inverse of the matrix in the variable v, 
                                ## having failed to find a non-NULL value for v in the above if.
}
##
## The first time cacheSolve is called, the function asks R to calculate the inverse 
## of the matrix using the solve() function. When calling the function again, the 
## inverse of the maxtix is retrieved from the cache variable v and a message is printed 
## "getting cached data" followed by the cached inverse matrix.
##
## Now run the following line of code in R.  It will return the value of the inverted matrix
##
cacheSolve(theFunctionList)  ## we are passing the function list we got from makeCacheMatrix to the function cacheSolve
##
## The expected output of this example is the following:
##      [,1] [,2]
## [1,]  0.0    1
## [2,]  0.5    0
##
## Now run the same statement again:
##
cacheSolve(theFunctionList)
## 
## this time, the expected output is:
## getting cached data
##      [,1] [,2]
## [1,]  0.0    1
## [2,]  0.5    0
##
## Thanks for reading and for your evaluation!




