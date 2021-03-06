makematrix<- function(x=matrix()){
  inv<-NULL
  set<-function(y){
    x<<-y
    inv<<-NULL
  }
  get<-function() {x}
  setinverse<-function(inverse){inv<<-inverse}
  getinverse<-function(){inv}
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}
cachesolve<-function(x, ...){
  inv<<-x$getinverse()
  if(is.null(inv)){
    print("getting cached data")
    return(inv)
  }
  mat<-x$get()
  inv<-solve(mat,...)
  x$getinverse(inv)
  inv
}

