# Assignment: WEEK 2 EXERCISE 3
# Name: Meyer, Jake
# Date: 2020-12-11

# Assignment: 
# A professor has recently taught two sections of the same course with only one difference between the sections. 
# In one section, he used only examples taken from sports applications, and in the other section, he used examples taken from a variety of application areas. 
# The sports themed section was advertised as such; so students knew which type of section they were enrolling in.
# The professor has asked you to compare student performance in the two sections using course grades and total points earned in the course.
# You will need to import the Scores.csv dataset that has been provided for you.

# Use the appropriate R functions to answer the following questions:
 
#  1. What are the observational units in this study?
##    The observational units in this study are the student scores.

#  2. Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
##    The independent variable mentioned in the narrative is the course (via the examples). The course variable is categorical since it is either sports themed examples or regular. 
##    The dependent variables in the narrative are the course grades and the total points measured from the students.
##    The course grade variable is categorical, whereas the total points variable is quantitative. 

#  3. Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
##    sports_section_df <- variable will contain the data set for the students in the sports section.
##    regular_section_df <- variable will contain the data set for the students in the non sports section.

#  4. Use the Plot function to plot each Sections scores and the number of students achieving that score. Use additional Plot Arguments to label the graph and give each axis an appropriate label. Once you have produced your Plots answer the following questions:
  
#     a. Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: Can you say that one section tended to score more points than the other? Justify and explain your answer.

#     b. Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.

#     c. What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?

## Read the "scores.csv" file located in my working directory and store as scores_df
## Summary of overall scores is printed.
scores_df <- read.csv("data/scores.csv", header = TRUE, sep = ",")
summary(scores_df)

## Variable sports_section_df created to contain grades and scores for the students in the sports section.
sports_section_df <- subset(scores_df, Section == "Sports", select = c(Count, Score, Section))
summary(sports_section_df)

## Variable regular_course_df to contain grades and scores for the students in the regular section. 
regular_section_df <- subset(scores_df, Section == "Regular", select = c(Count, Score, Section))
summary(regular_section_df)

## Install "ggplot2" and plot each respective section.
## install.packages("ggplot2")
library(ggplot2)

## Scatter Plot of the count of student scores within the sports section.
sports_plot <- ggplot(sports_section_df, aes(x = Score, y = Count)) + geom_point()
sports_plot + ggtitle("Count of Student Scores in Sports Section") + xlab("Student Score") + ylab("Count of Students")

## Scatter Plot of the count of student scores within the regular section. 
regular_plot <- ggplot(regular_section_df, aes(x = Score, y = Count)) + geom_point()
regular_plot + ggtitle("Count of Student Scores in Regular Section") + xlab("Student Score") + ylab("Count of Students")

## Comparison between the sections
sports_scores <- sports_section_df["Score"]
regular_scores <- regular_section_df["Score"]

sports_scores > regular_scores
