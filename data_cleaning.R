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

# make lower case mississippi upper case
df <- df %>% 
  mutate(State = if_else(State =='mississippi', 'Mississippi',State))

# make male and female in Gender col
df$Gender = as.character(df$Gender)

# female
df <- df %>% 
  mutate(Gender = if_else(Gender =='0', 'Female',Gender))

# male
df <- df %>% 
  mutate(Gender = if_else(Gender =='1', 'Male',Gender))




# what to do about WritingScore = 1???

