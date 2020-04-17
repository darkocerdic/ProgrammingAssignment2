## Put comments here that give an overall description of what your
## functions do

# I have just modified the given example of caching vector mean calculation
# to caching matrix solution calculation. The code looks almost identical to
# the example since the function is almost identical. The only thing needed
# to do was change all occurences of "mean" to "solve" and everything works.

## Write a short comment describing this function

# Similar to the one in the example, this function creates a special "vector"
# containing a functions to get/set the matrix solution and get/set matrix value
# The input parameter to this function is a plain matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## Write a short comment describing this function

# The input parameter to this function is a special matrix created by the
# first function
# Similar to the one in the example, this function calculates the solution of
# the given special matrix. If the solution was already calculated it uses
# the cached value.
# It does not work when plain matrix was passed as an input parameter!

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}

## Example use
# a <- matrix(c(1, 2, -1, 2), 2, 2)
# sa <- makeCacheMatrix(a)
# cacheSolve(sa)
