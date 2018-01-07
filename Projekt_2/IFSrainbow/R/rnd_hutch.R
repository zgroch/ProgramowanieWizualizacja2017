rnd_hutch <- function(point, ifs, depth, probs){
    k <- length(ifs)
    rnd <- sample( 1:k, depth, replace=TRUE, prob=probs )
    for(i in rnd) point <- ifs[[i]](point)

    return( c(point, rnd) )
}
