## two functions, 1 to setup cached matrix
## 2nd function to retrieve cached value if available, 
## otherwise calculate new value

## create the cached list containing
## x and matrix xinv

makeCacheMatrix <- function(x = matrix()) {
  
  xinv<<-solve(x)
  # store value of x when this function last called
  xlast<<-x
#  print("xlast:")
#  print(xlast)
  # store x and inverse of x in a list
  xlist<<-list(x=x,xinv=xinv)
  print(xlist)

}


## calculate the inverse of the matrix x

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    print("x sent to cacheSolve fn:")
    print(x)
  
    
  ## check if matrix has not changed,
  # i.e. if identical to previous matrix
      if (identical(x,xlast)){
        print("unchanged matrix:")
        get_xinv<-xlist$xinv
#        print(get_xinv)
    
        if(!is.null(get_xinv)) {
          message("getting cached data")
          return(get_xinv)
        }
      }
    
  # if have a new value of x 
    print("matrix has changed, setup new inverse and cache")
#    x$xinv<-solve(x)
    makeCacheMatrix(x)
    
}

