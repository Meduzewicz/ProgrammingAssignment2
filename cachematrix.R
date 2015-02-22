## This file contains two functions to computing inverse of matrix 
## with cached approach. First function create special matrix object
## which contains both original matrix and cached inversion of this 
## matrix. Second one computes an inversion of matrix (requires 
## matrix object returned by makeCacheMatrix()).

## Take a "normal" R matrix and return "special" matrix able
## to cache its inverse. 
## Input:
##    mat - given matrix()
##
## CacheMatrix object (list) consists of 4 functions:
##    set(), get() - save and restore an original matrix
##    setInvMat, getInvMat() - save and restore a cached inversed
##                                                        matrix
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


## CacheSolve() is a wrapper for solve() to easy use with CacheMatrix 
## object. If CacheMatrix has already computed and cached inversed
## matrix then CacheSolve() use this data instead computing it again.
## Input:
##    mat - CacheMatrix object

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
