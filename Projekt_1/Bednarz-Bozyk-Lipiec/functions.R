
Extract.Data <- function(data,records) {data[,records]}

Yes.to.True <- function(x) {x=="Yes"&!is.na(x)}

Parent.Education.Level <- function(is3,is4,is5,is6) {
  3*(is5|is6)+(1-(is5|is6))*(2*(is3|is4)+(1-(is3|is4))*1)}

Get.Answers <- function(country,question) {
  pisa.c <- pisa %>% filter(CNT==country)
  dcast(pisa.c,Education.Level ~ pisa.c[,question],
        fun.aggregate = length, value.var = "Education.Level") %>%
    select(-`NA`)}

Get.All.Answers <- function(country) {
  DATA <- Get.Answers(country,Questions[1])
  for(i in 2:length(Questions)){
  DATA[,-1] <- DATA[,-1] + Get.Answers(country,Questions[i])[,-1]
  }
  return(DATA)
}

Question.Text <- function(i) {
  c("Using a <train timetable> to work out\nhow long it would take to get from\none place to another.",
    "\nCalculating how much cheaper a TV\nwould be after a 30% discount.",
    "\nCalculating how many square metres\nof tiles you need to cover a floor.",
    "\nUnderstanding graphs presented\nin newspapers.",
    "\n\nSolving an equation like 3x+5=17.",
    "Finding the actual distance between\ntwo places on a map with\na 1:10,000 scale.",
    "\nSolving an equation like\n2(x+3)=(x+3)(x-3).",
    "\nCalculating the petrol consumption\nrate of a car.")[i]
}


Plot.Question <- function(country,question.number) {
  
  DATA <- Get.Answers(country,Questions[question.number]) %>%
    gather(Response,Number.of.students,`Very confident`:`Not at all confident`)
  
  DATA <- DATA[-c(4,8,12,16),]
  
  DATA$Response <- factor(DATA$Response,
                          levels = c("Confident","Not at all confident","Not very confident","Very confident"),
                          labels = c("Confident","Not at all confident","Not very confident","Very confident"))
  
  levels(DATA$Response) <- c(3,1,2,4)
  
  a <- list()
  
  for(k in 1:4) {
    a[k]<-as.numeric(sum(DATA$Number.of.students[DATA$Response==k]))
  }
  
  sum <- a[[1]]+a[[2]]+a[[3]]+a[[4]]
  wid <- c(rep(a[[3]]/sum,3),
           rep(a[[1]]/sum,3),
           rep(a[[2]]/sum,3),
           rep(a[[4]]/sum,3))
  
  X <- DATA %>%
    group_by(Response) %>%
    summarize(nos=sum(Number.of.students),nos3=sum(Number.of.students*(Education.Level==3))) %>%
    mutate(Percent.of.studs=nos3/nos)
  
  Responses <- c("Not at all confident","Not very confident","Confident","Very confident")
  
  ggplot(data=DATA,aes(x=as.numeric(Response),fill=as.factor(Education.Level))) +
    geom_bar(aes(y=Number.of.students),stat="identity",position="fill",width=wid) +
    theme_bw() + theme(legend.position="none") +
    scale_x_discrete(limits = Responses, labels=c("Not at all\n conf.","Not very\n conf.","Conf.","Very\n conf.")) +
    scale_fill_manual(values = c("Red", "Yellow", "Green")) +
    geom_line(data=X,aes(x=as.numeric(Response),y = Percent.of.studs, fill=NULL), group=1, color = "black") +
    geom_point(data=X,aes(x=as.numeric(Response),y = Percent.of.studs, fill=NULL), group=1, color = "black") +
    coord_cartesian(xlim=c(0.5,4.5),ylim=c(0,1),expand=FALSE) +
    theme(axis.title.x=element_blank(),plot.title = element_text(size = 10)) +
    ylab("% of students") + xlab("") +
    scale_y_continuous(breaks=seq(0,1,.25),minor_breaks = NULL,labels=paste0(seq(0,1,.25)*100,"%")) +
    ggtitle(Question.Text(question.number))
}

Plot.Summary <- function(country) {
  
  DATA <- Get.All.Answers(country) %>%
    gather(Response,Number.of.students,`Very confident`:`Not at all confident`)
  
  DATA <- DATA[-c(4,8,12,16),]
  
  DATA$Response <- factor(DATA$Response,
                          levels = c("Confident","Not at all confident","Not very confident","Very confident"),
                          labels = c("Confident","Not at all confident","Not very confident","Very confident"))
  
  levels(DATA$Response) <- c(3,1,2,4)
  
  a <- list()
  
  for(k in 1:4) {
    a[k]<-as.numeric(sum(DATA$Number.of.students[DATA$Response==k]))
  }
  
  sum <- a[[1]]+a[[2]]+a[[3]]+a[[4]]
  wid <- c(rep(a[[3]]/sum,3),
           rep(a[[1]]/sum,3),
           rep(a[[2]]/sum,3),
           rep(a[[4]]/sum,3))
  
  X <- DATA %>%
    group_by(Response) %>%
    summarize(nos=sum(Number.of.students),nos3=sum(Number.of.students*(Education.Level==3))) %>%
    mutate(Percent.of.studs=nos3/nos)
  
  Responses <- c("Not at all confident","Not very confident","Confident","Very confident")
  
  y.limit <- max(DATA$Number.of.students)+1000
  
  ggplot(data=DATA,aes(x=as.numeric(Response),fill=as.factor(Education.Level))) +
    geom_bar(aes(y=Number.of.students),stat="identity",position="dodge") +
    theme_bw() + theme(legend.position="none") +
    scale_x_discrete(limits = Responses, labels=c("Not at all\n conf.","Not very\n conf.","Conf.","Very\n conf.")) +
    scale_fill_manual(values = c("Red", "Yellow", "Green")) +
    coord_cartesian(xlim=c(0.5,4.5),ylim=c(0,y.limit),expand=FALSE) +
    theme(axis.title.x=element_blank(),plot.title = element_text(size = 12)) +
    ylab("Total number\nof answers") + xlab("") +
    scale_y_continuous(minor_breaks = NULL) +
    ggtitle(paste0("Summary of answers:\n",country))
}

Enter <- function() {cat("\n")}

Newpage <- function() {cat("\\vfill\\eject\n")}
