hierfstat_by_pop <- function(working_dir,input_fstat_file,na_coded,diploidTF) {
  print("Please install hierfstat and then call this function by hierfstat_by_pop(working_dir,input_fstat_file,na_coded,diploidTF)")
  print("where working_dir = your working directory where your input_fstat_file is located")
  print("input_fstat_file = your fstat file")
  print("na_coded = how your missing data is coded")
  print("diploidTF = whether your data is diploid (TRUE) or not (FALSE)")
  cat('for example: hierfstat_by_pop("Downloads","Me_plu_sol_info_coded_Jan_2018_for_FSTAT.dat",c("0"),TRUE)\n')
  print("")
  
  print("An error following this print statement means hierfstat has not been installed:")
  print("")
  library(hierfstat)
  print("hierfstat is installed! An error following this print statement means your working_dir cannot be found")
  print("")
  setwd(working_dir)
  print("Your working directory is all good. An error following this print statement means either:")
  print("your input file can't be found, it is formatted incorrectly, or hierfstat can't understand how your NAs are coded")
  print("")

  hierfstobject <- read.fstat(input_fstat_file, na.s = na_coded)
  
  print("Your input file is all good. An error following this print statement means either:")
  print("You failed to specifiy whether your data is diploid (TRUE) or not (FALSE) or what you specified doesn't match your data")
  print("")

  hierfstbasicstats <- basic.stats(hierfstobject,diploid=diploidTF)
  print("We are all good to go")
  print("")
  
  write.csv(hierfstbasicstats$overall,"all_populations_hierfstbasicstats_overall.csv",quote=FALSE)
  write.csv(hierfstbasicstats$perloc,"all_populations_hierfstbasicstats_perlocus.csv",quote=FALSE) 
  
  print("Your analysis over all populations has been written out as:")
  print("all_populations_hierfstbasicstats_overall.csv and all_populations_hierfstbasicstats_perlocus.csv")
  print("")  
  
  pops <- unique(hierfstobject$Pop)
  
  for (i in pops) {
    tempfstobject <- hierfstobject[(which(hierfstobject$Pop==i)),]
    temphierfstbasicstats <- basic.stats(tempfstobject,diploid=diploidTF)
    temp_overall_data_name <- paste(i,"_hierfstbasicstats_overall.csv",sep="")
    temp_per_locus_data_name <- paste(i,"_hierfstbasicstats_perlocus.csv",sep="")
    write.csv(temphierfstbasicstats$overall,temp_overall_data_name,quote=FALSE)
    write.csv(temphierfstbasicstats$perloc,temp_per_locus_data_name,quote=FALSE)
  }
      
  print("Your population specific data has been written out as:")
  print("pop#_hierfstbasicstats_overall.csv and pop#_hierfstbasicstats_perlocus.csv")
  print("")
  
  }  

