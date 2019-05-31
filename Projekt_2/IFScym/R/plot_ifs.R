#' Plot IFS object
#'
#' Plot each function given in constructor with k iterations
#' @param k iterations of contractions we will perform
#' @param RES resolution of pixels drawn onto a plot (points go from floats to integers at some point)
#' @param KOL colour of the image, e.g. "red", "green", "black", "#20592b".
#' @return Raw data used for plotting and a plot as a by-product
#' @export
#' @examples plot(createIFS(IFSkoolnamr::sierpinski), k = 8)

plot.IFS <- function(.obj, k = 7, RES = c(500, 500), KOL = "black") {
  functions <- .obj[[1]]
  points_with_count <- list(c(0,0,1)) # seed

  ps <- list(c(0,0))
  total <- list()

  new_points <- next_set(FNS = functions, seed = ps)
  total <- append(total, new_points)

  if (k >= 2) { # if anybody argues that R is a sensible "language"... WhyTF IS seq(0) == [0, 1]
    # TODO count 'em
    for (i in seq(k-1)) {
      new_points <- next_set(FNS = functions, seed <- new_points)
      total <- append(total, new_points)
    }
  }

  result <- do.call(rbind.data.frame, total)
  colnames(result) <- c('X', 'Y')

  cat("Calculated", length(total), "points.\n")

  # rounded <- floor(result * 1000) / 1000 # round up points so they will be treated as a grid with constant intervals
  #
  rounded <- correct.to.resolution(result, RES)
  rounded <- cbind(rounded, c(1))

  sp::coordinates(rounded) <- ~X+Y
  sp::gridded(rounded) <- TRUE

  # this may fail
  rasterDF <- raster::raster(rounded)

  plot.new()
  plot(rasterDF, col=grDevices::colorRampPalette(c(KOL))(1), legend=FALSE, yaxt="n", xaxt="n", box=FALSE)

  return(result)
}

#' @keywords internal

next_set <- function(FNS, seed) {
  unlist( # flatten list of lists, but only one level down
    lapply(FNS, function(f) { # apply each function to each point, receive list of lists
      lapply(seed, f)
    }),
    recursive = FALSE
  )
}

#' @keywords internal

correct.to.resolution <- function(pts, RES) {
  # from below
  correction <- sapply(pts, min)
  pts <- sweep(pts, 2, correction, "-")

  # from above
  correction <- sapply(pts, max)
  scale_by <- RES / correction

  # scale all the pixels
  pts <- sweep(pts, 2, scale_by, "*")

  # floor
  rbind.data.frame(sapply(pts, floor))
}


