## The function counts the time it takes to compute two consecutive inverses of the same. matrix

## If the code is retrieving cache, then it should take less to compute the second time.

test <- function(mat){

     temp <- makeCacheMatrix(mat)
     
     start.time1 <- Sys.time()
     cacheSolve(temp)
     dur1 <- Sys.time() - start.time1
     print(dur1)
    
     start.time2 <- Sys.time()
     cacheSolve(temp)
     dur2 <- Sys.time() - start.time2
     print(dur2)
}


## Example of a large matrix
# r <- rnorm(1000000)
# testMatrix <- matrix(r, nrow=1000, ncol=1000)


## Run the function on the matrix
# test(testMatrix)