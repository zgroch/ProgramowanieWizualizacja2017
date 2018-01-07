generateIFSgif_loop <- function(A, fractal){
    functions <- fractal
    result <- data.frame()
    for(f in functions){
        fA <- apply( A, 1, f )
        fA <- as.data.frame(t(fA))
        colnames(fA) <- c("x", "y")
        result <- rbind( result, fA )
    }
    return( result )
}

generateIFSgif <- function(startPoint, depth, fractal){
    result <- data.frame(t(startPoint))
    for( i in 1:depth ){
        result <- generateIFSgif_loop(result, fractal)
    }
    colnames(result) <- c("x", "y")
    return( result )
}

#' @title Creating gifs for a given fractal
#'
#' @description
#' The \code{createIFSgif} function, writes a fractal with given parameters
#' on the disk
#'
#' @param startPoint from, which point (vertor of length 2) fractal is created
#' @param depth how depth is fractal
#' @param fractal the fractal from which the gif is made (list of function)
#' @param resolution how exactly do we paint a gif
#' @param filename the name with which the file is saved
#' @param scale how many times the gif is enlarged
#'
#' @examples
#'f1 <- function(p){return(c(p[1]/2 - 0.5, p[2]/2 + 0.5))}
#'f2 <- function(p){return(c(p[1]/2 - 0.5, p[2]/2 - 0.5))}
#'f3 <- function(p){return(c(p[1]/2 + 0.5, p[2]/2 - 0.5))}
#'
#'createIFSgif(startPoint = c(0,0), depth =8, list(f1,f2,f3),
#'             resolution = 2, filename = "output.gif", scale = 1)
createIFSgif <-function(startPoint,depth,fractal,resolution=2,filename,scale=1){
    diamy <- 0
    diamx <- 0

    for(l in 1:depth){
        IFS <- generateIFSgif(startPoint,l,fractal)
        f <- round(IFS,resolution)
        xmin <- min(f[,1])
        xmax <- max(f[,1])
        ymin <- min(f[,2])
        ymax <- max(f[,2])
        diamy <- max(diamy,(ymax-ymin)*10^resolution*1.1+2)
        diamx <- max(diamx,(xmax-xmin)*10^resolution*1.1+2)
    }

    DM <- array(0,c(diamy*scale,diamx*scale,depth))

    for(l in 1:depth){
        IFS <- generateIFSgif(startPoint,l,fractal)
        f <- round(IFS,resolution)
        f <- dplyr::distinct(f,x,y)

        xmin <- min(f[,1])
        xmax <- max(f[,1])
        ymin <- min(f[,2])
        ymax <- max(f[,2])
        tmp_diamy <- (ymax-ymin)*10^resolution+2
        tmp_diamx <- (xmax-xmin)*10^resolution+2

        for(i in 1:nrow(f)){

            x<-(round((f[i,1]-min(f[,1]))*10^resolution+1+(diamx-tmp_diamx)/2))*scale
            y<-(round((f[i,2]-min(f[,2]))*10^resolution+1+(diamy-tmp_diamy)/2))*scale
            DM[diamy*scale - y,x,l]<-1
        }
    }

    image <- (DM*120)+50
    caTools::write.gif(image, filename, col=rainbow(256), delay=40)
}
