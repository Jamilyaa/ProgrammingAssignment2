## Put comments here that give an overall description of what your
## functions do

## This function is used to create a special object that stores a matrix and cache's its 
##inverse.
install.packages("pracma")
library(pracma)
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(mmm) m <<- mmm
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)}



## Next function calculates the inverse of the special matrix created with the above 
##function. However, it first checks to see if the inverse has already been 
##calculated. If so, it gets the inverse from the cache and skips the 
##computation. Otherwise, it calculates the inverse of the matrix and sets the 
##value of the inverse in the cache via the setinv function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  cacheSolve <- function(x) {
    m <- x$getinv()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- inv(data)
    x$setinv(m)
    m
  }
  
  
}

