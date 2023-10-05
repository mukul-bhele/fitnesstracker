# Activity Metrics Analysis
## Introduction

In an era of ever-evolving wearable technology and smart devices, the quantified self is becoming increasingly popular. Users are empowered with devices that track various aspects of their daily lives, from physical activity and sleep patterns to heart rate and calorie expenditure. The Activity Metrics Analysis project delves into this rich source of data to uncover valuable insights into human behavior, health, and the intricate relationships between different activity factors.

![image](https://github.com/mukul-bhele/fitnesstracker/blob/fd1f615b3aa77d3da602ff8ef8227593090b512d/Activity%20Metrics%20Analysis%20-%20Image.png)

### Why Activity Metrics Matter

Physical activity and health are intricately connected. How we move, rest, and exercise profoundly impacts our overall well-being. These metrics, often collected passively through smart devices, offer a window into our daily routines, habits, and even potential health risks. Understanding and interpreting these data points can provide individuals with the knowledge to make informed lifestyle choices and healthcare providers with valuable insights for patient care.

## Project Objectives

The primary aim of the Activity Metrics Analysis project is to harness the power of data-driven insights to improve health and well-being. Key objectives include:

1. **Uncovering Behavioral Patterns:** Analyzing step counts, calorie burn, and heart rates to identify behavioral patterns & trends among users.
2. **Exploring Sleep-Activity Relationships:** Investigating how sleep duration and quality influence daily activity levels and calorie expenditure.
3. **Health Implications:** Exploring the relationships between different types of activities (e.g., sedentary, light, moderate, vigorous) and their potential health implications.
4. **Detecting Anomalies:** Employing data analytics to detect outliers and anomalies in the dataset, which could be indicative of underlying health conditions.

By achieving these objectives, the Activity Metrics Analysis project aims to promote a holistic understanding of individual health and well-being based on data-driven insights.

## Data Sources
These datasets were generated by respondents to a distributed survey via Amazon Mechanical Turk between 03.12.2016-05.12.2016. Thirty eligible users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. Variation between output represents use of different types of trackers and individual tracking behaviors / preferences."

The project sources data from a variety of smart devices, including fitness trackers, smartwatches, and other wearable technology. These devices collect and record users' activity data, creating a comprehensive dataset for analysis. Before analysis begins, the dataset undergoes a rigorous preprocessing phase to ensure data accuracy and consistency. In the following sections, we will delve into the project's methodology, data analysis techniques, and key findings and provide marketing strategy and recommendation that how the company can get benefitted from analysis in persective of business analytics. We invite you to explore the fascinating world of activity metrics and their profound impact on our daily lives and health.

Dataset Link : https://www.kaggle.com/datasets/arashnic/fitbit/data

## Business Task
1. What are the emerging patterns in the usage of smart devices?
2. How might these emerging patterns be relevant to potential customers?
3. How can these emerging patterns contribute to shaping marketing strategies?

## Data Preprocessing

Before diving into the analysis, several preprocessing tasks were performed to clean and format the data:

1. **Elimination of Duplicates and Data Type Correction:** Duplicate records were identified and removed to avoid data redundancy. Data types were corrected for 'Date' and 'Time' and other numerical columns to ensure consistency and accuracy in further analysis.
2. **Handling Outliers and Anomalies:** Outliers, which can skew results, were carefully identified and dealt with. Anomalies that could result from errors or inconsistencies in data collection were addressed to maintain data integrity.
3. **Merging Relevant Datasets:** Different datasets related to physical activity, sleep patterns, health metrics, and time-based data were merged where necessary. This consolidation allowed for a comprehensive analysis across multiple dimensions.
4. **Creation of Derived Features:** New features were generated based on existing data to provide more insights. Aggregation of data, feature engineering, and calculations were performed to create meaningful derived features.

These preprocessing steps were done on **Excel** ensure that the data used for analysis is clean, consistent, and ready for in-depth exploration and interpretation.
**Note:** Detailed information regarding specific preprocessing tasks and their outcomes can be found in the subsequent sections of this documentation.

## Prepare
In order to address the business objectives, I will utilize a dataset of fitness tracker data (CC0: Public Domain, sourced from Mobius). This dataset encompasses data from thirty users who consented to share their personal tracker information, including details on physical activity, heart rate, and sleep monitoring at the minute level. It provides insights into daily activity, steps taken, and heart rate, offering valuable information about user behaviors.

Considerations:
- There may be a sampling bias as the selection process for participants is not specified. Users who choose to share their activity data publicly might be more frequent Fitbit users.
- The dataset lacks information regarding the gender of the users, while Bellabeat is a wellness company specifically designed for women.
- The data is from 2016, making it outdated given the significant advancements in fitness tracker technology since then.

In this project, I employed Excel for initial data preprocessing and cleaning tasks. SQL was utilized for data processing and conducting specific analyses. Additionally, I utilized Python, along with visualization libraries, to create visual representations of the data. Furthermore, I employed Power BI to craft informative dashboards for enhanced data presentation and interpretation.

## Analysis

### Activity Patterns
A comprehensive analysis of activity patterns and calorie expenditure was carried out:

- The relationship between step count and calories burned was explored.
- Anomalies in calorie data, specifically values below 1000, were investigated.
- Users who consistently wore the smartwatch throughout the day were identified based on their activity data.
- Various activity patterns were examined, including peak activity hours and trends in sedentary behavior.

### Sleep Quality
The quality of sleep was assessed by considering sleep duration and heart rate data:

- Users with consistent and adequate sleep patterns were identified.
- Correlations between sedentary time, sleep duration, heart rate, and calorie patterns were explored.
- The relationship between sleep quality and levels of physical activity was examined in detail.

### Calories Patterns
Calories patterns were examined in detail:

 - The analysis delved into how users' calorie expenditure varied over time.
 - Correlations between calorie burn, activity levels, and sleep quality were explored.
 - This information can provide valuable insights for personalized health and fitness recommendations.

### Heart Rate Analysis
To assess potential health risks among users, an analysis of heart rate data was conducted. It's important to note that abnormally low or high heart rates can serve as indicators of underlying health issues.

- A normal heart rate range for most adults typically falls between 60 to 100 beats per minute (bpm).
- Users displaying exceptionally low heart rates were identified and subjected to further investigation.

However, it's essential to emphasize that without additional contextual information, such as gender, age, and health status, definitive health assessments cannot be made solely based on Fitbit data.

## Dashboard 
Created the Activity Metrics Analytics Dashboard through an in-depth analysis of fitness tracker data. Leveraging the capabilities of Power BI, this dashboard empowers users with interactive reports for data-driven health decisions, offering valuable insights to optimize well-being.
Dashboard Link : 
## Business Strategy Implications
These insights are instrumental in shaping Bellabeat's business strategy. By understanding user behavior and health indicators, Bellabeat can tailor its products and services more effectively. For instance, the company can develop features or content aimed at improving sleep quality, increasing physical activity, or monitoring heart health.

## Marketing Strategy Recommendations
Bellabeat can also leverage these insights to refine its marketing strategy. The company can target specific user segments with tailored campaigns. For example, users with sedentary behavior may be targeted with messages promoting physical activity, while those with sleep issues may receive content related to improving sleep patterns.

These insights provide valuable information regarding users' health, activity, and sleep patterns, allowing for a more in-depth understanding of their behaviors and potential areas for improvement. They also serve as a foundation for strategic decision-making and marketing efforts.

## Conclusion
The analysis of this dataset has unveiled valuable insights into users' physical activity, sleep quality, and potential health risks. It is crucial to keep in mind the limitations of this analysis, primarily the absence of demographic information about users. These findings underscore the significance of heart rate data and sleep patterns in evaluating users' overall health and well-being. Furthermore, the exploration of activity patterns and calorie expenditure can lay the groundwork for personalized health and fitness recommendations. This analysis equips us with the tools to better understand users' habits and needs, facilitating more targeted and effective strategies in the realms of health, wellness, and fitness.

To create effective marketing strategies that tap into untapped growth potentials and drive business development, we must refer to the analysis presented above and take these insights into consideration. The following recommendations are offered to address this business scenario.


