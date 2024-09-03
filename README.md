# GLOBOX FOOD AND DRINK BANNER EXPERIMENT: AN A/B TESTING ANALYSIS

## SUMMARY

GloBox, a hypothetical, renowned purveyor of exclusive fashion and luxury decor products, recently conducted a rigorous A/B test on its mobile website to evaluate the impact of a food and drink banner. The results from the Treatment Group, which was exposed to the banner, showed a statistically significant increase in conversion rates. However, there was no significant difference in average spending between the Treatment and Control Groups. This analysis also provided insights into device, gender, and region-specific behaviors, with some indications of potential novelty effects. The results suggest that while the banner effectively increased user conversions, it did not influence the amount users spent. Thus, this statistical analysis prompts a cautious approach, leading to the recommendation not to launch the banner due to inconclusive evidence.

## CONTEXT

GloBox has recently expanded its product offerings to include food and drink items, aiming to boost revenue in this category. To raise awareness, the company implemented an A/B test on its mobile website, introducing a food and drink banner to assess its impact on user conversions and spending. Users were randomly assigned to either a Control Group, which did not see the banner, or a Treatment Group, which did. The primary metric of interest was the conversion rate, defined as the percentage of users who made a purchase.

The study aimed to evaluate two main outcomes: the effect of the banner on conversion rates and on average user spending. Additionally, it explored user behavior across various dimensions, including device type, gender, and geographical location, offering insights that could inform future marketing strategies.

The procedural framework for the A/B testing unfolds as follows:
Step 1 – Data Exploration and Extraction with SQL:
During this initial phase, I embarked on the exploration and extraction of essential data for the A/B testing from a database comprising three tables:
- The "users" table houses user IDs and demographic information, such as country and gender.
- The "groups" table logs user A/B test group assignments, containing user IDs, join dates, and device types.
- The "activity" table records user purchase activity, featuring user IDs, purchase dates, device types, and the corresponding expenditure in USD.

Utilising SQL queries, I harnessed pertinent information, encompassing user interactions, conversion rates, and the average spending for both the Control and Treatment Groups.

Step 2 – A/B Testing Statistics using Python:
With the data successfully collected, a series of hypothesis tests were conducted to compare conversion rates and average spending between the two groups. The Null hypothesis (H0) posited no disparity in conversion rates and average spending, while the alternative hypothesis (H1) proposed the existence of significant differences. Employing both t-tests and z-tests at a 5% significance level, Python, was employed to ascertain the statistical significance of the results.

## RESULTS: ANALYSIS OF THE BANNER EXPERIMENT

In the quest to evaluate the impact of the promotional banner on user behavior, this analysis provides a detailed examination of conversion rates and average spending. The results reveal significant insights that will guide GloBox’s strategic decisions. Below are the key findings and recommendations:

 Test Groups Overview
Test Groups	Conversion Rate	Average Amount Spent	Sample Size
Control (A)	4.16%           	$3.37	24,402
Treatment (B)	4.94%	$3.38	24,680

### Conversion Rates Analysis
Upon conducting a comprehensive analysis of user conversion rates in the A/B test, several key findings emerge. The overall user conversion rate currently stands at 4.28%, with a closer examination revealing disparities: 4.16% for the control group and 4.94% for the treatment group, and 0.78 percentage points (0.0078) of difference.
 
The analysis reveals a statistically significant increase in conversion rates for the Treatment Group compared to the Control Group. The Z-score of 4.1692 significantly exceeds the critical value of 1.9600, and the p-value of 0.0000 confirms that the observed difference is highly significant. The 95% confidence interval for the difference in conversion rates is (0.0042, 0.0115), which excludes zero, further validating the significance of the result.

In term of practical significance, although the statistical difference is clear, the practical significance of the 0.78 percentage point increase should be considered. While the banner's impact is statistically significant, the practical implications may be modest depending on the business context.

### Average Spending Analysis
The average amount spent per user shows no statistically significant difference between the Control and Treatment Groups, with the following details of average amount spent:
- Control Group: $3.37
- Treatment Group: $3.38
- Difference: $0.01
The t-statistic of -0.0597 and the p-value of 0.9524 suggest that any observed difference in spending is likely due to chance. The 95% confidence interval for the difference in spending is (-$0.43, $0.46), which includes zero, indicating no significant impact. 

### Device-Specific Analysis
Insightful Findings:
The impact of the food and drink banner on iOS users is truly noteworthy. The Treatment Group experienced a remarkable 6.87% uplift in conversion rate upon exposure to the banner. In contrast, the Control Group's iOS users observed a 6.18% increase in conversion rate following banner exposure. Meanwhile, For iOS users within the Treatment Group, there was a slight reduction in the average amount spent, approximately £4.90 less. This figure is notably lower than the average amount spent by iOS users in the Control Group, which stands at £5.05. Thus, the banner led to a significant uplift in conversion rates among iOS users but resulted in a decrease in average spending.

For Android users, the banner improved both conversion rates and average spending. This analysis observed that both average spending and conversion rates were generally lower than their iOS counterparts. However, the Treatment Group still demonstrated a significant 3.77% increase in conversion rate among Android users upon banner exposure. In comparison, the Control Group's Android users witnessed a 2.94% boost in conversion rate following the banner exposure.
 
The banner also exerted a positive influence on the average amount spent by Android users. The Treatment Group displayed an increase of £2.46 in the average amount spent among Android users exposed to the banner, which is a notable improvement compared to the Control Group's average of £2.31.

### Gender-Specific Analysis
Insights Unveiled:
Upon dissecting the data within both the Control and Treatment Groups, a consistent trend emerges—males consistently exhibit lower conversion rates and average spending across all genders. However, the Treatment Group's male users experienced a remarkable 4.01% increase in conversion rate, a significant contrast to the Control Group's male users, who only realized a 2.77% increase in conversion rate. Thus, males in the Treatment Group experienced a substantial improvement in conversion rates. Females, on the other hand, already had a relatively higher conversion rate in the Control Group, standing at 5.47%. The Treatment Group's impact on female users was less pronounced, resulting in a modest increase to 5.76%. Thus, females showed a smaller improvement in conversion rates with the banner.
 
Examining spending habits, males in the Control Group spent an average of £2.25, a figure lower than their counterparts in the Treatment Group, who averaged £2.59 in spending. Conversely, females in the Control Group spent an average of £4.45, which was notably higher than the average amount spent by females in the Treatment Group, standing at £4.12.

### Country and Region-Specific Analysis
Insights:
In the scrutinized data, a conspicuous pattern emerges, unveiling that virtually every nation within the Treatment Group showcases a marked uptick in their conversion rates when juxtaposed with their Control Group counterparts, with one notable exception—Turkey. Notably, within the confines of Europe, the Treatment Group stands out as a beacon of success, manifesting a significantly elevated conversion rate in stark contrast to the Control Group. This disparity may be ascribed to the remarkable efficacy of the modifications instituted in the Treatment Group.
Shifting the focus of this analysis to Latin America, an analogous trend becomes apparent, as the Treatment Group experiences a favorable impact, resulting in an increment of approximately 0.2% in conversion rates. This, in turn, strongly suggests that the implemented alterations in this region have borne fruit. Nevertheless, the scenario in Asia paints a divergent narrative. The Treatment Group in Asia registers a decrease in spending following exposure to the promotional banner, thereby necessitating a deeper inquiry to fathom the reasons behind this unanticipated outcome.

Reverting to Europe, it is noteworthy that the Treatment Group has displayed a modest uptick in the average amount spent. This rise, from £3.39 in the Control Group to £2.69 in the Treatment Group, implies a positive impact on spending in this region. This phenomenon could potentially signify that the changes have not only improved the conversion rate but have also incentivized customers to invest more in the platform.
 
 
 
Let us now delve into the specific regional data. In the realm of North America, the data reveals that Canada, within the Treatment Group, boasts a conversion rate of 6.48%, exceeding its Control Group counterpart's 5.06%. Similarly, the United States, within the Treatment Group, exhibits a conversion rate of 6.10%, surpassing its Control Group counterpart's 5.39%. With regard to the average expenditure, the data indicates that in the Treatment Group, Canada records an average spend of £4.20, surpassing the Control Group's £3.59. Conversely, the United States, within the Treatment Group, reports an average expenditure of £4.04, slightly less than the Control Group's £4.28.

In Latin America, the data portrays Brazil in the Treatment Group with a conversion rate of 4.19%, outperforming the Control Group's 3.99%. Mexico in the Treatment Group exhibits a conversion rate of 4.81%, markedly exceeding the Control Group's 3.12%. Regarding the average amount spent, the data discloses that Brazil, within the Treatment Group, records an average spend of £3.06, slightly less than the Control Group's £3.21. Conversely, Mexico, within the Treatment Group, reports an average expenditure of £3.33, surpassing the Control Group's £2.81.

In Australia, users in the Treatment Group register a conversion rate of 3.04%, significantly higher than Australia's Control Group conversion rate of 2.14%. Furthermore, the average amount spent in Australia within the Treatment Group stands at £2.08, exceeding the Control Group's average of £1.67.

Within Europe, the data unveils that Germany, in the Treatment Group, boasts a conversion rate of 4.90%, significantly higher than the Control Group's 3.50%. Spain in the Treatment Group exhibits a conversion rate of 4.29%, surpassing the Control Group's 2.91%. France, within the Treatment Group, records a conversion rate of 4.43%, outperforming the Control Group's 3.31%. Great Britain, in the Treatment Group, demonstrates a conversion rate of 4.13%, exceeding the Control Group's 3.02%. Concerning the average amount spent, the data discloses that Germany, within the Treatment Group, registers an average spend of $2.69, somewhat less than the Control Group's $3.39. Spain, in the Treatment Group, reports an average expenditure of $3.21, surpassing the Control Group's $2.18. France, within the Treatment Group, records an average spend of $2.26, slightly less than the Control Group's $2.67. Great Britain, within the Treatment Group, displays an average spend of $4.48, markedly exceeding the Control Group's $2.11.
Turning to the Middle East, the data unveils that Turkey, within the Treatment Group, exhibits a conversion rate of 3.86%, somewhat lower than the Control Group's 4.16%. Furthermore, the average amount spent in Turkey within the Treatment Group stands at $2.48, falling below the Control Group's average of $3.68.

In summary, the data analysis reveals that the Treatment Group has consistently yielded favorable outcomes, boasting higher conversion rates across most regions, save for Turkey. The substantial improvements noted in Europe and Latin America indicate the efficacy of the introduced changes in these areas, while Asia presents a unique challenge with a reduction in spending. These invaluable insights can guide us in formulating future strategies and optimizations to maximize the performance of the Treatment Group.

### Novelty Effects Analysis

In pursuit of unveiling potential novelty effects, a meticulous examination was undertaken. This endeavor focused on tracking the evolution of vital metrics, specifically the conversion rate and average spending per user, within the Control Group (A) and the Treatment Group (B) over time. It is often observed that novelty effects manifest as initial surges or declines in these metrics, ultimately stabilizing as time progresses.

To facilitate this analysis, an SQL query was meticulously employed to extract these metrics over time. This query meticulously scrutinizes disparities in key metrics, namely, the conversion rate and average spending per user, between the Control Group (A) and the Treatment Group (B) over time, with the express purpose of pinpointing any indications of a novelty effect.

This query, with unwavering precision, provides daily metrics for both groups, allowing us to scrutinize potential temporary fluctuations in the conversion rate or average spending for users who have registered and converted. This analysis is rooted in their respective registration and transaction dates, encompassing both the Control and Treatment Groups, particularly during the period in which the banner was introduced.

To lend a more comprehensive context to these observations, I have harnessed the capabilities of Tableau to present this data visually. This analysis is on the lookout for noteworthy fluctuations or discernible patterns that may hint at the existence of a novelty effect. In summation, this analysis is dedicated to the unwavering pursuit of comprehending the evolving trends in these key metrics over time, focusing on registered and converted users from both the Control and Treatment Groups, particularly within the time frame of the banner's introduction.

1. Distribution of Average Amount Spent by Registered vs. Converted Users:
Upon scrutinizing the visualization of the distribution of average spending by registered users versus converted users, certain intriguing patterns emerge. Notably, the chart below starkly illustrates that the average amount spent by converted users in the Treatment Group substantially exceeds that of their counterparts in the Control Group during two distinct periods: from January 30 to February 1, 2023, and around February 5, 2023.
 
Despite the fascinating variations evident in the chart, these trends are characterized by inconsistency and do not inherently constitute definitive proof of a novelty effect. It is imperative that this analysis embark on further investigation to unearth any latent factors contributing to the conspicuous increase in spending among converted users in the Treatment Group during the aforementioned time intervals.

2.	Conversion Rates of All Users of Both the Control and Treatment Groups:
To glean a clearer insight into the manifestations of novel user behaviour, an in-depth examination of conversion rates for users within the Control and Treatment groups is indispensable. A visual representation of conversion rates for all users in both groups reveals a consistent trend of elevated conversion rates, commencing from around January 28, 2023, and extending until February 6, 2023, as depicted in the chart below.
 
The relatively sustained nature of the line chart mentioned earlier indicates the presence of a novelty effect, manifesting itself in the form of heightened conversion rates among users in the Treatment Group during more than half of the time periods since the introduction of the banner.

Novelty effects analysis in Python confirms that the banner in the Treatment group had a statistically significant positive impact on conversion rates compared to the control group. The observed difference of 0.78 percentage points is statistically significant, with a very low p-value and a confidence interval that excludes zero. These results indicate that the banner effectively increased user conversions, validating the effectiveness of the promotional strategy for food and drink products on the website.

### Power Analysis

The power analysis conducted using Python for the A/B test on the mobile website's conversion rates and average spending per user offers crucial insights into the reliability and sensitivity of the experiment's outcomes. This analysis focused on evaluating the probability of correctly identifying true effects, if present, in two key metrics: conversion rates and average spending.

The power for detecting differences in conversion rates between the control and treatment groups was found to be 0.9865. This exceptionally high power value (98.65%) indicates a robust capability of the study to correctly identify a true difference in conversion rates, assuming such a difference exists. A power value close to 1.0, as observed here, implies that the sample size and expected effect size were well-calibrated, minimizing the risk of Type II errors (failing to detect a true effect). Therefore, the findings related to conversion rate differences are highly reliable and statistically significant, making this aspect of the study a strong basis for decision-making. In contrast, the power for detecting differences in average spending per user was calculated to be 0.0502. This extremely low power value (5.02%) suggests that the study was underpowered in this aspect, meaning there was a high likelihood of failing to detect a true difference in spending between the groups even if one existed. Several factors could contribute to this low power, including a smaller effect size than anticipated, high variability in spending, or an insufficient sample size. The result indicates that any conclusions drawn about the impact of the banner on average spending should be approached with caution, as the study design did not provide adequate sensitivity to detect meaningful differences in this metric.

The power analysis underscores a clear distinction in the effectiveness of the A/B test across the two analyzed metrics. While the conversion rate analysis was conducted with high power, ensuring a reliable detection of significant effects, the spending analysis revealed significant limitations due to low power. This discrepancy suggests that while the promotional banner's effect on conversion rates can be interpreted with confidence, any conclusions about its impact on average spending are less certain and may require further investigation. For future studies, improving the design to increase the power of spending analyses will be essential. This could involve increasing the sample size, reducing the variability in spending data, or setting more realistic expectations for effect sizes. Such improvements would enhance the study's ability to detect subtle but potentially meaningful effects on average spending, thereby providing a more comprehensive evaluation of the banner's overall impact.

## KEY FINDINGS AND RECOMMENDATION

The findings not advocate for the banner's launch, highlighting the importance of continuous monitoring and adaptation in this dynamic environment. The following are the key findings and recommendations derived from this meticulous analysis.

### Recommendations:
Considering the inconclusive evidence, the recommendation is not to launch the food and drink banner at this time. Further investigation into long-term effects, targeted marketing strategies, and continuous monitoring of user behavior is recommended. The focus should be on understanding the nuances of user responses and optimizing strategies for sustained success by addressing the following aspects:

1. Conversion Rates:
   - The treatment has significantly improved conversion rates. It is advisable to implement the banner more broadly to capitalize on this positive effect.

2. Average Spending:
   - No significant impact on average spending was observed. Further research into spending behavior or alternative strategies may be necessary to influence user spending.

3. Regional Strategies:
   - Tailor strategies based on regional performance. Focus on regions showing significant improvement, while addressing challenges in areas like Asia and Turkey.

4. Continuous Monitoring:
   - Monitor the banner's impact over time to assess long-term effects and potential novelty impacts.

In conclusion, while the promotional banner has demonstrated a significant positive impact on conversion rates, its effect on average spending is negligible. Therefore, while the banner could be beneficial for improving user engagement, further strategies are needed to enhance its impact on user spending before a broader implementation is recommended.

## APPENDIX
### SQL Queries Link
The first step of the analysis was writing queries to extract data to use in the next statistical analysis in Python. The SQL queries are available in the following [link](https://github.com/cherryaugusta/GloBox_A-B_Testing_Analysis/blob/main/globox_project.sql)

### Python Codes
In the following step, I used Python to perform the A/B test statistics. The Python codes is available in the following [link](https://github.com/cherryaugusta/GloBox_A-B_Testing_Analysis/blob/main/globox_statistical_analysis.ipynb)

### Tableau Links
The next step was visualizing the data on Tableau. This is the link to the Tableau story where you can find all the insights and findings:
1.	[Link to the Dashboard of Conversion Rate and Average Amount of Spent between the Test Groups](https://public.tableau.com/views/The_Conversion_Rate_and_Average_Spent_between_the_Test_Groups/Dashboard-GloBoxFoodandDrinkBannerExperiment?:language=en-GB&:display_count=n&:origin=viz_share_link)

2.	[Link to the Dashboard of Average Amount Spent and Conversion Rate by All Users](https://public.tableau.com/views/novelty_effects_analysis-dual_axis_average_spent-registered_vs_converted_users/Dashboard-AverageAmountSpentandConversionRatebyAllUsers?:language=en-GB&:display_count=n&:origin=viz_share_link)

3.	[Additional visualisations link for Conversion and Average Spent for Each User’s Country 1](https://public.tableau.com/views/Conversion_and_Average_Spent_Globally-2Sheets/Sheet1?:language=en-GB&:display_count=n&:origin=viz_share_link)

4.	[Additional visualisation for Conversion and Average Spent for Each User’s Country 2](https://public.tableau.com/views/Conversion_and_Average_Spent_for_Each_Users_Country/Sheet1?:language=en-GB&:display_count=n&:origin=viz_share_link)

### Video Presentation Link 
The final step was to present the A/B testing findings. My brief presentation is available in the following [link](https://www.loom.com/share/701ca122e39941d8a56cf5835d678c4f?sid=cc04d80c-1862-4b5c-9663-99bf11c9835b)
