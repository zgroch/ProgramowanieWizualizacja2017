toRGB <- function(coord){
    coord %>%
        as.hexmode() %>%
        paste(collapse="") %>%
        toupper() -> code

    return( paste0("#", code) )
}

tocolor <- function(v){
    d <- length(v)
    result <- c(0,0,0)
    for(i in 1:d){
        result[v[i]] <- result[v[i]] + 1/2^(d-i+1)
    }
    return( floor(256*result) )
}

ggclean <- function(){
    ggplot2::theme(axis.line=ggplot2::element_blank(),
          axis.text.x=ggplot2::element_blank(),
          axis.text.y=ggplot2::element_blank(),
          axis.ticks=ggplot2::element_blank(),
          axis.title.x=ggplot2::element_blank(),
          axis.title.y=ggplot2::element_blank(),
          legend.position="none",
          panel.background=ggplot2::element_blank(),
          panel.border=ggplot2::element_blank(),
          panel.grid.major=ggplot2::element_blank(),
          panel.grid.minor=ggplot2::element_blank(),
          plot.background = ggplot2::element_rect(fill = "transparent",colour = NA))
}
