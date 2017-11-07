#### NAME: compareBoxplot
#### DESCRIPTION:
####    This function makes given image brighter.
#### ARGUMENTS:
#### ## data: dataframe or tibble, data used to perform analysis
#### ## country: string, name of the country in question
#### ## country_colname: string, name of the data column that contains country name
#### ## results_colname: string, name of the data column that contains test results
#### ## question_colname: strin, name of he data column that contains answer to the layering question
#### ## quest_title: string, printed name of the question
#### ## results_title: string, printed name of the results
#### ## show_flag: logical, should country flag be given in background (default=TRUE)
#### ## flags_dir: string, directory to folder where flag pictures (.png) are stored; name of the file should <name_in_dataset>.png
#### ## alpha: numeric, brightness level of the flag, if presented
#### ## color_boxes: logical, should boxes be colored with intensity according to the number of answers in respective questions
#### ## print_weights: logical, should percentage of answers be printed on the boxes
compareBoxplot <- function(
    data, country, country_colname, results_colname, question_colname,
    quest_title, results_title, show_flag, flags_dir, alpha, color_boxes, print_weights
){
    data <- changeColnames(data,
                           oldNames = c(country_colname, results_colname, question_colname),
                           newNames = c("cnt", "results", "question"))
    
    img <- readPNG(paste0(flags_dir, country,".png"))
    g <- rasterGrob(img, interpolate=TRUE) 
    
    aggrs <- data %>% 
        filter(cnt==country) %>% 
        group_by(question) %>% 
        na.omit() %>% 
        summarize(m = median(results), n=n(), q=quantile(results,.75))
    
    ggplot(subset(data, !is.na(question) & cnt==country), aes(question, results, fill=question)) +
    {if(show_flag) annotation_custom(rasterGrob(brighten(img, alpha), 
                                                width = unit(1,"npc"), 
                                                height = unit(1,"npc"),
                                                gp=gpar(alpha=.5)), 
                                     -Inf, Inf, -Inf, Inf)} +
        geom_boxplot() +
        scale_fill_manual(values=ntocolor(aggrs$n, use=color_boxes)) +
        guides(fill=FALSE) +
        {if(print_weights) geom_text(data=aggrs, aes(x=aggrs$question, y=(aggrs$m+aggrs$q)/2, 
                                                     label=boxlab(aggrs$n)))} +
        theme(plot.title = element_text(size=22, lineheight=1.5, face="bold", hjust=.5),
              axis.title.y = element_text(size=19, margin=margin(0,10,0,0), lineheight=1.7, face="bold", hjust=.5)) +
        labs(x = quest_title, y=results_title) +
        coord_flip()
}

#### NAME: compareDensity
#### DESCRIPTION:
####    This function makes given image brighter.
#### ARGUMENTS:
#### ## data: dataframe or tibble, data used to perform analysis
#### ## country: string, name of the country in question
#### ## country_colname: string, name of the data column that contains country name
#### ## results_colname: string, name of the data column that contains test results
#### ## question_colname: strin, name of he data column that contains answer to the layering question
#### ## quest_title: string, printed name of the question
#### ## results_title: string, printed name of the results
#### ## show_flag: logical, should country flag be given in background (default=TRUE)
#### ## flags_dir: string, directory to folder where flag pictures (.png) are stored; name of the file should <name_in_dataset>.png
#### ## alpha: numeric, brightness level of the flag, if presented
#### ## legend_position: string, position of the legend ("top","bottom", etc.)
compareDensity <- function(
    data, country, country_colname, results_colname, question_colname,
    quest_title, results_title, show_flag, flags_dir, alpha, legend_position
){
    data <- changeColnames(data,
                           oldNames = c(country_colname, results_colname, question_colname),
                           newNames = c("cnt", "results", "question"))
    
    img <- readPNG(paste0(flags_dir, country,".png"))
    g <- rasterGrob(img, interpolate=TRUE) 
    
    return(
        ggplot(subset(data, !is.na(question) & cnt==country), aes(results)) +
        {if(show_flag) annotation_custom(rasterGrob(brighten(img, alpha), 
                                                    width = unit(1,"npc"), 
                                                    height = unit(1,"npc"),
                                                    gp=gpar(alpha=.5)), 
                                         -Inf, Inf, -Inf, Inf)} +
            geom_line(stat="density", lwd=1, aes(colour=question)) +
            # guides(color=guide_legend(title=question_title)) + 
            guides(color=FALSE) + 
            theme(plot.title = element_text(size=22, lineheight=1.5, face="bold", hjust=.5),
                  axis.text.y = element_blank(), axis.ticks.y = element_blank(),
                  legend.position = legend_position) +
            labs(x = results_title, y=NULL) + scale_color_manual(values=c("blue", "red"))
    )
}
###### Compare Rank

compareRank <- function(country, meansPerCountry){
    meansPerCountry$rozmiar <- ifelse(meansPerCountry$cnt == country, 3, 1)
    cols <- c("1", "2")[(meansPerCountry$cnt == country) + 1]
    
    ggplot(meansPerCountry, aes(m, 0, size = rozmiar)) +
        geom_point(aes(colour = cols)) +
        scale_color_manual("Country", values = c("blue4", "orangered3")) + 
        labs(title = NULL, y=NULL, x=NULL) + 
        theme_classic()+
        theme(legend.position="none", axis.ticks.y=element_blank(),axis.text.y = element_blank(), axis.line=element_blank()) +
        coord_fixed(ratio=10)
}



#### NAME: brighten
#### DESCRIPTION:
####    This function makes given image brighter.
#### ARGUMENTS:
#### ## img: object of type nativeRaster, as returned by readPNG {png} function
#### ## alpha: degree of brightening
brighten <- function(img, alpha){
    return( (img + alpha)/(1+alpha) )
}

#### NAME: lab
#### DESCRIPTION:
####    This function defines, how the labels of boxplot should be formatted
#### ARGUMENTS:
#### ## count: a vector of counts
boxlab <- function(count){
    normalise <- count/sum(count)
    rounded <- round(normalise, 2)
    return(
        paste0( 100*rounded, "%")
    )
}

#### NAME: ntocolor
#### DESCRIPTION:
####    This function gives RGB color names basing on vector of counts
#### ARGUMENTS:
#### ## count: a vector of counts
#### ## use: logical; if false, the result is a vector of whites
ntocolor <- function(count, use){
    normalise <- count/sum(count)
    vol <- 256 - round(256*normalise)
    colcode <- toupper( as.hexmode(vol) )
    if(use){
        result <- paste0( "#FF", colcode, colcode )
    } else {
        result <- replicate(length(count), "#FFFFFF")
    }
    
    return(
        result
    )
}

#### NAME: changeColnames
#### DESCRIPTION:
####    This function changes column names in a datframe
#### ARGUMENTS:
#### ## data: a dataframe
#### ## oldNames: vector of strings, old column names
#### ## newNames: vector of strings, new column names
changeColnames <- function( data, oldNames, newNames ){
    idx <- sapply( oldNames, function(nm){ (1:ncol(data))[colnames(data)==nm] } )
    colnames(data)[ idx ] <- newNames
    return(data)
}

#### NAME: toTeXnames
#### DESCRIPTION:
####    This function creates an appropriate link to an artifact in the archivist Remote Repo
#### ARGUMENTS:
#### ## GITusername: self-explanatory
#### ## GITrepo: self-explanatory
#### ## MD5: md5 code of the artifact, created by the archivist::asave function
MD5title <- function(GITusername, GITrepo, MD5){
    paste0("\\verb|aread(\"", GITusername, "/", GITrepo, "/", MD5, "\")|")
}

#### NAME: ggsaveInLatexLoop
#### DESCRIPTION:
####    This function helps to save ggplots to a file in Sweave loop (ggsave just don't work)
#### ARGUMENTS:
#### ## GITusername: self-explanatory
#### ## GITrepo: self-explanatory
#### ## MD5: md5 code of the artifact, created by the archivist::asave function
ggsaveInLatexLoop <- function(myplot, file1, width, height){
    postscript(file=file1, paper="special", width=width, height=height)
    print( myplot )
    dev.off()
}

#### NAME: GITpushAndCommit
#### DESCRIPTION:
####    This function perform communication with github
#### ARGUMENTS:
#### ## GITusername: self-explanatory
#### ## GITrepo: self-explanatory
GITpushAndCommit <- function(GITrepo, GITusername){
    committext <- paste0("cd ", GITrepo, "; git add .; git commit -m \"No message\"")
    system(committext)
    pushtext <- paste0("cd ", GITrepo, "; git push https://", GITusername, ":",
           GITpassword, "@github.com/", GITusername, "/",
           GITrepo, ".git --all")
    system(pushtext)
}

#### NAME: TeX______
#### DESCRIPTION:
####    The set of functions that print TeX parts of the report
TeXpackages <- function(){
    cat("
    \\documentclass{beamer}
    \\usepackage{graphicx}
    \\usepackage{Sweave}
    \\usepackage{multicol}
    \\usepackage{tikz}
    \\usepackage{caption}
    ")
}

TeXtheme <- function(){
    cat("
    \\setbeamertemplate{caption}{\\raggedright\\insertcaption\\par}
    \\usepackage[font={small}]{caption}
    \\usetheme{Madrid}
    \\usecolortheme{default}
    \\setbeamertemplate{caption}[default]
    \\makeatletter
    \\setbeamertemplate{frametitle}
    {
        \\ifbeamercolorempty[bg]{frametitle}{}{\\nointerlineskip}
        \\@tempdima=\\textwidth
        \\advance\\@tempdima by\\beamer@leftmargin
        \\advance\\@tempdima by\\beamer@rightmargin
        \\vskip1ex
        \\begin{beamercolorbox}[sep=8pt,center,colsep=-4bp,rounded=true]{frametitle}
            \\usebeamerfont{frametitle}
            \\vbox{}\\vskip-1ex
            \\if@tempswa\\else\\csname beamer@ftecenter\\endcsname\\fi
            \\strut\\insertframetitle\\strut\\par
            {
                \\ifx\\insertframesubtitle\\@empty
                \\else
                {\\usebeamerfont{framesubtitle}\\usebeamercolor[fg]{framesubtitle}\\insertframesubtitle\\strut\\par}%
                \\fi
            }
            \\vskip-1ex
            \\if@tempswa\\else\\vskip-.3cm\\fi
        \\end{beamercolorbox}
    }
    \\makeatother
    \\setbeamertemplate{caption}{\\raggedright\\insertcaption\\par}
    ")
}

TeXbasicdata <- function(){
    cat("
    \\title{I love math but does she love me?}
    \\subtitle{The analysis of PISA 2012 dataset.}
    \\author[M. Futrega, \\L. Rajkowski]{Micha\\l\\ Futrega and \\L ukasz Rajkowski}
    \\institute[MIM UW]{Faculty of Mathematics, University of Warsaw}
    \\date{\\today}
    ")
}

TeXbutton <- function(){
    cat("
    \\setbeamertemplate{section in toc}{\\inserttocsectionnumber.~\\inserttocsection}
    \\beamertemplatenavigationsymbolsempty
    
    \\newcommand\\AddButton{
    \\setbeamertemplate{background canvas}{
    \\begin{tikzpicture}[remember picture,overlay]
    \\node[anchor=west] at ([yshift=20pt,xshift=1em]current page.south west)
      {\\hyperlink{toc}{\\beamergotobutton{Table of contests}}};
    \\end{tikzpicture}
      }
    }
    ")
}

TeXtitlepage <- function(){
    cat("
    \\begin{document}
    \\begin{frame}
        \\titlepage
        \\center{\\footnotesize We observed that countries where the affection to mathematics 
goes hand in hand with test results is ranked higher than country where there is no such correlation. 
}
    \\end{frame}
    ")
}

TeXTOC <- function(){
    cat("
    \\begin{frame}[label=toc] 
    \\frametitle{List of countries} 
    \\begin{multicols}{4}
    \\scriptsize
    \\tableofcontents
    \\end{multicols}
    \\end{frame}
    ")
}

TeXcountrySummary <- function(
    country, file1, file2, file3,
    GITusername, GITrepo, 
    thisCountryBoxplotMD5, thisCountryDensityMD5, thisCountryRankPlotMD5,
    arepo_fontsize
){
    cat("\\AddButton")
    cat("\\section{", country, "}")
    cat("\\begin{frame}[t, fragile=singleslide]")
    cat("\\frametitle{", country, "}")
    
    cat("\\vspace*{-.4cm}")
    cat("\\begin{figure}")
    cat("\\begin{minipage}[t]{.52\\textwidth}")
    cat("\\centering")
    cat("\\includegraphics[width=3.2cm, angle=270]{", file1, "}", sep="")
    cat("\\caption*{\\scriptsize 
        {\\bf Boxplots} of the test score.
        The number on the box is the percentage of students within the group.
        It is also indicated by the fill.}")
    cat("\\vspace{-.4cm}")
    cat("\\fontsize{", arepo_fontsize, "}{", 1.2*arepo_fontsize, "}", MD5title(GITusername, GITrepo, thisCountryBoxplotMD5))
    cat("\\end{minipage}")
    cat("\\begin{minipage}[t]{.44\\textwidth}")
    cat("\\centering")
    cat("\\includegraphics[width=3.2cm, angle=270]{", file2, "}", sep="")
    cat("\\caption*{\\scriptsize 
        {\\bf Density estimation} of the test score within the groups of 
        {\\color{red} (strong) likers} and {\\color{blue}(strong) dislikers}.}")
    cat("\\vspace{-.4cm}")
    cat("\\fontsize{", arepo_fontsize, "}{", 1.2*arepo_fontsize, "}", MD5title(GITusername, GITrepo, thisCountryDensityMD5))
    cat("\\end{minipage}")
    cat("\\\\")
    cat("\\vspace{-2.5cm}")
    cat("\\end{figure}")
    
    cat("\\begin{figure}")
    cat("\\centering \\includegraphics[width=6.0cm, height=10.0cm, angle=270]{", file3, "}", sep="")
    cat("\\vspace{-2.5cm}")
    cat("\\caption*{\\scriptsize", country, " mean score is \\ {\\Large\\bf\\color{red}",  
        thisCountryRank, "} out of ", max_rank, " countries}")
    cat("\\vspace*{-.4cm}")
    cat("\\fontsize{", arepo_fontsize, "}{", 1.2*arepo_fontsize, "}", MD5title(GITusername, GITrepo, thisCountryRankPlotMD5))
    cat("\\end{figure}")
    cat("\\end{frame}")
}

# save! -------------------------------------------------------------------

save(file="functions.RData", compareDensity, compareBoxplot, compareRank, changeColnames, 
     ntocolor, boxlab, brighten, MD5title, ggsaveInLatexLoop, GITpushAndCommit,
     TeXpackages, TeXtheme, TeXbasicdata, TeXbutton, TeXtitlepage, TeXTOC, TeXcountrySummary)
