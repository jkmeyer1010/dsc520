# Assignment: Exercise 5
# Name: Meyer, Jake
# Date: 2020-12-20

# 1. What are the elements in your data (including the categories and data types)?
#    The elements are listed below along with the data type and category:
#    Element: Data Type, Category
#    ID: Character, Categorical (Nominal with ID's)
#    ID2: Integer, Categorical (Nominal with shortened ID's)
#    Geography: Character, Categorical (Nominal based on County, State)
#    PopGroupID: Integer, Categorical (Nominal based on Group 1)
#    POPGROUP,display.label: Character, Categorical (Nominal based on "Total Population")
#    RacesReported: Integer, Continuous (Integer for number of races reported)
#    HSDegree: Numeric, Continuous (Ratio variable for HS Degree)
#    BachDegree: Numeric, Continuous (Ratio Variable for Bachelor's Degree)

# 2. Please provide the output from the following functions: str(); nrow(); ncol()
#     str(survey_df)
#    'data.frame':	136 obs. of  8 variables:
#     $ Id                    : chr  "0500000US01073" "0500000US04013" "0500000US04019" "0500000US06001" ...
#     $ Id2                   : int  1073 4013 4019 6001 6013 6019 6029 6037 6059 6065 ...
#     $ Geography             : chr  "Jefferson County, Alabama" "Maricopa County, Arizona" "Pima County, Arizona" "Alameda County, California" ...
#     $ PopGroupID            : int  1 1 1 1 1 1 1 1 1 1 ...
#     $ POPGROUP.display.label: chr  "Total population" "Total population" "Total population" "Total population" ...
#     $ RacesReported         : int  660793 4087191 1004516 1610921 1111339 965974 874589 10116705 3145515 2329271 ...
#     $ HSDegree              : num  89.1 86.8 88 86.9 88.8 73.6 74.5 77.5 84.6 80.6 ...
#     $ BachDegree            : num  30.5 30.2 30.8 42.8 39.7 19.7 15.4 30.3 38 20.7 ...
#     nrow(survey_df)
#     [1] 136
#     ncol(survey_df)
#     [1] 8
# 3. Create a Histogram of the HSDegree variable using the ggplot2 package.
#    The plot was created as seen below:

#    a. Set a bin size for the Histogram.
#       The bin size for the histogram was determined to be 12 bins with a width of 2.775. The number of bins was determined by taking the square root of the number of data points (136) and rounding up to 12. The bin width was calculated by determining the range (95.5-62.2) divided by the number of bins (12).

#    b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.
#       Included in the plot.

# 4. Answer the following questions based on the Histogram produced:
  
#    a. Based on what you see in this histogram, is the data distribution unimodal?
#       Yes, the histogram is unimodal since there is one clear most frequent value. 

#    b. Is it approximately symmetrical?
#       No, the distribution is not approximately symmetrical.

#    c. Is it approximately bell-shaped?
#       No, the distribution is not approximately bell-shaped.

#    d. Is it approximately normal?
#       No, the distribution is not approximately normal.

#    e. If not normal, is the distribution skewed? If so, in which direction?
#       Yes, the distribution is skewed negatively - left skewed. (the frequency scores are clustered at the higher end and the tail points toward lower or more negative scores).  

#    f. Include a normal curve to the Histogram that you plotted.
#       Normal curve included to the Histogram previously plotted (now density plot)

#    g. Explain whether a normal distribution can accurately be used as a model for this data.
#       A normal distribution cannot be used to accurately model this data in the current state. The skewed distribution would need to be transformed into a normal distribution in order to utilize the data set.

# 5. Create a Probability Plot of the HSDegree variable.
#    The Probability Plot of HSDegree is shown below:

# 6. Answer the following questions based on the Probability Plot:
  
#    a. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
#       No, the distribution is not approximately normal. If the distrubition was normal, then the data points would follow the linear trend much closer throughout the distribution. There is a curve away from the line indicating a skew with the data set.

#    b. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
#       The distribution is not normal. Yes, there is a negative skew with the data set. The distribution is negatively skewed since the data points are trailing off from the linear path near the negative scores.

# 7. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
#    The screenshot for stats.desc() is shown below:

# 8. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?
#    For a normal distribution, the skewness coefficient would be approximately 0. With the stat.desc() output, one can see the skewness coefficient is at -1.67 indicating the distribution is negatively skewed.
#    For the Kurtosis, the coefficient for Kurtosis would be approximately close to 3. With the stat.desc() output, one can see the Kurtosis coefficient of 4.35. This indicates the distribution is leptokurtic. 
#    The Shakiro-Wilks test indicates the normtest.p probability value less than alpha (0.05) indicating the distribution is not normally distributed.  
#    A Z-score is useful for indicating how far a measurement is from the average. Z-scores standardize a distribution to conveniently indicate where a given measurement resides within the data set. Since the distribution is skewed, the Z-scores would also be skewed when the data is converted to Z-scores.
#    The sample size may reduce the impact of the skewed distribution. If the sample size is decreased within the population, then their may be violations for normatlity. Large sample sizes are more resilient against skewness, however smaller sample sizes (less than 20) may return incorrect results with normality calculations. 

## R Code for Exercise 5
## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/jkmey/Documents/Work_Documents/Bellevue_Data_Science/3_DSC_520_Statistics_for_DataScience/DSC_520_Github_Repository/dsc520")

## Load the `data/acs-14-1yr-s0201.csv` to
survey_df <- read.csv("data/acs-14-1yr-s0201.csv")

## Outputs for str(), nrow(), and ncol().
str(survey_df)
nrow(survey_df)
ncol(survey_df)

## create a histogram of the "HSDegree" variable and determine summary statistics.
surveyHistogram_density <- ggplot(survey_df, aes(HSDegree)) + geom_histogram(binwidth = 2.775, bins = 12, colour = "black", aes(y=..density..,fill=..count..)) + ggtitle("Population Percent with High School Degree") + xlab("High School Degree (%)") + ylab("Density")
surveyHistogram_density
summary(survey_df["HSDegree"])

##Include a normal distribution curve on the histogram
surveyHistogram_Normal <- surveyHistogram_density + stat_function(fun=dnorm, color = "red", args=list(mean=mean(survey_df$HSDegree), sd=sd(survey_df$HSDegree)))
surveyHistogram_Normal

## Create a probability plot of the "HSDegree" variable.
probability_plot <- qqnorm(survey_df$HSDegree); qqline(survey_df$HSDegree)
probability_plot

## Use the stat.desc() to quantify normality.
## install.packages("pastecs")
library(pastecs)
round(stat.desc(survey_df$HSDegree, basic = TRUE, desc = TRUE, norm = TRUE, p = 0.95), 3)
