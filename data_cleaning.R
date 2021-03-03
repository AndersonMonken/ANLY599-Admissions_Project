library(tidyverse)

df <- read_csv('SummerStudentAdmissions2.csv')

# remove rows without a decision or that are not waitlist, admit, or decline
df <- df %>% 
  filter(!is.na(Decision)) %>% 
  filter(Decision %in% c('Admit','Decline','Waitlist'))

# remove rows with gpa outside of range 2-4 (standard 4.0 gpa scale)
df <- df %>% filter(GPA <= 4 & GPA >=2)

# remove rows with -1 for gender
df <- df %>% filter(Gender != -1)

# remove rows with WorkExp > 10
df <- df %>% filter(WorkExp <= 10)

# make lower case virginia upper case
df <- df %>% 
  mutate(State = if_else(State =='virginia', 'Virginia',State))

# what to do about WritingScore = 1???

