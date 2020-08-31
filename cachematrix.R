## Below are two functions that are used to create a special object that stores a
## matrix and cache's its inverse.
 
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  spec_matrix <- NULL
  set <- function(y){
    x <<- y
    spec_matrix <<- NULL
  }
  get <- function() x
  setInv <- function(inv) spec_matrix <<- inv
  getInv <- function() spec_matrix
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.
## If the inverse has already been calculated, and the matrix didn't changed,
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  spec_matrix <- x$getinv()
  if(!is.null(spec_matrix)) {
    message("getting cached data")
    return(spec_matrix)
  }
  dat <- x$get()
  spec_matrix <- solve(dat, ...)
  x$setinv(mspec_matrix)
  spec_matrix
  ## Return a matrix that is the inverse of 'x'
}
