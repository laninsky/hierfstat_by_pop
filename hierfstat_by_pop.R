working_dir <- "Downloads"
input_fstat_file <- "Me_plu_sol_info_coded_Jan_2018_for_FSTAT.dat"

library(hierfstat)
setwd(working_dir)


robinbasicstats<-basic.stats(robinhierfst,diploid=TRUE,digits=4)
