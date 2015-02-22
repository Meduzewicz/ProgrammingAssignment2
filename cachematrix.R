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

cacheSolve <- function(mat, ...) {
  ## check whether inversed matrix is computed or not
  im <- mat$getInvMat()
  if(!is.null(im)) {
    ## inverse is computed so all we need to do is return it
    return(im)
  }
  
  ## get original matrix and compute its inverse matrix
  im <- solve(mat$get(), ...)
  
  ## cache computed inverted matrix and than return it as a result of function
  mat$setInvMat(im)
  im
}
