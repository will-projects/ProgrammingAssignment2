## These functions set and invert a specified matrix. These are then cached.

## This function performs the basic matrix operations of setting a matrix (set),
## getting a matrix (get), setting the matrix inverse (setinverse), and getting
## the matrix inverse (getinverse).

makeCacheMatrix <- function(x = matrix()) {
    i = NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) i <<- inv
    getinverse <- function() i
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

##asdf
## This function performs the matrix inversion and also caches the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data)
    x$setinverse(i)
    i
}
