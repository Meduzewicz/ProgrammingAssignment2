## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(mat = matrix()) {
  ## inverted matrix not yet computed
  invMat <- NULL
  
  ## set new matrix
  set <- function(newMat) {
    mat <<- newMat
    invMat <<- NULL ## clear inversion (not yet calculate for new matrix)
  }
  
  ## return matrix (original) matrix
  get <- function() {
    mat
  }
  
  ## set inverted matrix
  setInvMat <- function(newInvMat) {
    invMat <<- newInvMat
  }
  
  ## return inverted matrix or NULL if not calculated yet
  getInvMat <- function() {
    invMat
  }
  
  ## return list with all necessary functions
  list(set = set, get = get,
       setInvMat = setInvMat,
       getInvMat = getInvMat)  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
}
