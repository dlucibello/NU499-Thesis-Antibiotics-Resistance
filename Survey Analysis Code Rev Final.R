# Assume mu = 3, so we set the null hypothesis to 3/6 
#H0: Responses from merely guessing would be = 3/6
#HA: Responses from nurses correctly choosing would be > 3/6

#Correct answers are counted if endorsement includes 
# any of the option numbers 2, 4, 6, 8, 9 and 10
# In the survey, 6 out of 10 options to choose from are correct.
# We are not penalizing for guessing.  
# How many correct options would a nurse endorse? 

#Run the following libraries:
install.packages('tidyverse')
install.packages('ggplot2')
library(tidyverse)
library(ggplot2)

#Import data from .csv files
professsionalnurses <- read.csv('ProfessionalNurses1.csv')
professsionalnurses <- professsionalnurses[1:625,]
studentnurses <- read.csv('StudentNurses1.csv')
studentnurses <- studentnurses[1:122,]

correctonesP <- professsionalnurses %>%
  select(correct.selected)

correctonesS <- studentnurses %>%
  select(correct.selected)

#Assess Professional Nurse Responses
mean(correctonesP$correct.selected, na.rm = TRUE)
sd(correctonesP$correct.selected, na.rm = TRUE)
ggplot(data = correctonesP, aes(x = correct.selected)) +
  geom_histogram(binwidth = 1, boundary = 0.5) +
labs(y = 'Count', x = 'Correct Answers Selected')

t.test(correctonesP, alternative = "greater", mu = 3)

#Assess Student Nurse Responses
mean(correctonesS$correct.selected, na.rm = TRUE)
sd(correctonesS$correct.selected, na.rm = TRUE)
ggplot(data = correctonesS, aes(x = correct.selected)) +
  geom_histogram(binwidth = 1, boundary  = 0.5) +
  labs(y = 'Count', x = 'Correct Answers Selected')

t.test(correctonesS, alternative = "greater",mu = 3)
