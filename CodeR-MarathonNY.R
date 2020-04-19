# Analyse des données du Marathon de New-York - Scraping with ParseHub
# Alain Lucas
# 13-04-2020


# Options and libraries
rm(list=ls())
options(width=150)

library(dplyr)
library(tidyr)

# Read data
readLines("Data/Marathon-NewYork.csv",n=5)

dataset = read.table("Data/Marathon-NewYork.csv",sep=",",head=TRUE,quote="\"")
head(dataset)

# Data Preparation

dataset %>% group_by(Runner_name) %>% slice(1L) %>% 
  select(-Runner_Distance_name,-Runner_Distance_Time) -> data1
  
dataset %>% select(Runner_name,Runner_Distance_name,Runner_Distance_Time) %>% 
  spread(key = Runner_Distance_name,value=Runner_Distance_Time) -> data2

data1 %>% inner_join(data2,by="Runner_name") %>% 
  select(Runner_name,Runner_SexeAge,Runner_Nationality,Runner_Team,
         '3M','5K','4M','5M','6M','10K','7M','8M','9M','15K',
         '10M','11M','12M','20K','13M',HALF,'14M','15M','25K',
         '16M','17M','18M','30K','19M','20M','21M','35K','22M',
         '23M','24M','40K','25M','26M',MAR) %>% head



  
