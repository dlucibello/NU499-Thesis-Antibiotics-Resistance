# Assume mu = 3, so we set the null hypothesis to 3/6 
# H0: Responses from merely guessing would be = 3/6
# HA: Responses from nurses correctly choosing would be > 3/6

#Correct answers are counted if endorsement includes 
# any of the option numbers 2, 4, 6, 8, 9 and 10
# In the survey, 6 out of 10 options to choose from are correct.
# This scoring scheme does not penalize for guessing.  
# Research question: How many correct options of 6 would a nurse endorse? 

#*********************************************************
#Remove the "#" comment symbol to install the following 
# two libraries as needed:
# install.packages('tidyverse')
# install.packages('ggplot2')
#*********************************************************

#Run the following libraries:
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

t.test(correctonesP, mu = 3)

#Assess Student Nurse Responses
mean(correctonesS$correct.selected, na.rm = TRUE)
sd(correctonesS$correct.selected, na.rm = TRUE)
ggplot(data = correctonesS, aes(x = correct.selected)) +
  geom_histogram(binwidth = 1, boundary  = 0.5) +
  labs(y = 'Count', x = 'Correct Answers Selected')

t.test(correctonesS, mu = 3)
