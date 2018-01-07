generateIFS <- function(ifs, n, depth, probs=replicate(length(ifs),1), inits="random", seed=FALSE){
    if( seed ) set.seed( seed )

    if( identical(inits, "random") ){
        inits <- data.frame(x=2*runif(n)-1, y=2*runif(n)-1)
    } else {
        inits <- inits[ sample( 1:nrow(inits), n, TRUE), ]
    }
    points_and_paths <- apply( inits, 1, function(p) rnd_hutch(p, ifs, depth, probs) ) %>%
        t %>% data.frame

    points <- points_and_paths[, c(1,2)]
    colnames(points) <- c("x","y")

    return(
        list(points = points, paths = points_and_paths[, -c(1,2)])
    )
}
