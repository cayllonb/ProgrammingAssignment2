## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  
##Initilize variables  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
##define set and get functions and cache solve function  
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function
##Computes the inverse of the special matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
##If the cached inverse exists returns it  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
##If teh cached inverse not exists then calculates the inverse  
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
