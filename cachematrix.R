## Two functions defined here for my R Programming Class, Assignment 2
## Enjoy the peer review! Hope I added to your perspective

## makeCacheMatrix Function:
## This function creates a special matrix which is really a list containing a function to
## set the value of the matrix (set)
## get the value of the matrix (get)
## set the value of the inverse matrix (setinverse)
## get the value of the inverse matrix (getinverse)

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## cacheSolve Function:
## The following function calculates the inverse of the special matrix created with the above function. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
