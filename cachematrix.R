## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


## the following code creates an example matrix that can be passed 
## to the functions above, and will not generate an error when passed 
## to the solve function. I found this example matrix on a web page 
## attributed to John Myles White with the title "Quick Review of 
## Matrix Algebra in R":
##
m <- matrix(c(0, 2, 1, 0), nrow=2, ncol=2, byrow=TRUE)