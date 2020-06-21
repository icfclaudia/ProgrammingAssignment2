## Generates a matrix which can store its own inverse.

makeCacheMatrix <- function(x = matrix()) {
        
        ## x: a square invertible matrix
        ## return: a list containing functions to
        ##      1. set the matrix
        ##      2. get the matrix
        ##      3. set the inverse
        ##      4. get the inverse
        ##      the list is used as the input to cacheSolve()
        

        s <- NULL
        
                
        ## 1. set the matrix
        set <- function(y) {
                
                # `<<-` assigns a value to an object in an environment 
                # different from the current environment
                
                x <<- y
                s <<- NULL
        }
        
        
        ## 2. get the matrix
        get <- function() x
        
        
        ## 3. set the inverse
        setsolve <- function(solve) s <<- solve
        
        
        ## 4. get the inverse
        getsolve <- function() s
        
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
        
}



## Checks if the solve function was run on the matrix previously and retrieves the data. If not, it calculates it.

cacheSolve <- function(x, ...) {

        ## x: output of makeCacheMatrix()
        ## return: inverse of the original matrix input to makeCacheMatrix()
        
        
        s <- x$getsolve()
        
        
        # if the inverse has already been calculated
        if(!is.null(s)) {
                
                # get it from the cache and skips the computation. 
                message("getting cached data")
                return(s)
        }
        
        # otherwise, calculates the inverse
        data <- x$get()
        s <- solve(data, ...)
        
        # sets the value of the inverse in the cache via the setinv function.
        x$setsolve(s)
        s
        
}
