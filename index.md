
## **A.K.A - R**  Group's Progress Journal

### Group Members

- [Aybike Dilek](https://pjournal.github.io/mef04-AybikeDilek/)
- [Kami Üçkardeş](https://pjournal.github.io/mef04-KamiUckardes/)
- [Alican Sevimay](https://pjournal.github.io/mef04-AlicanSevimay/)
- [Betül Parlar](https://pjournal.github.io/mef04-parlarbetul/)

### Group Term Project 

#### Traffic Announcements of İstanbul (2018-2020)

The group analyzed, traffic announcements entered into the system from January 2018 to October 2020 by the transportation management center of İstanbul Municipality. In dataset there are 12 variables such as; Announcement Type, Starting and ending time of the event, Location, etc. and 58,422 records. The aim of the group was to conduct various analyzes using these 12 variables either individually or together.

- [Project Proposal](Project-Proposal.html)
- [Exploratory Data Analysis of Project](EDA_Traffic_Announcements.html) 
- [Exploratory Data Analysis of Project - PDF](EDA-of-Traffic-Announcements--Istanbul-UYM-_PDF.pdf) 
- [ShinyApps](https://aybikedilek.shinyapps.io/ShinyApps_of_EDA/) 
- [Presentation](file:///C:/Users/Aybike/Desktop/Presentation.html#1)

#### Key Takeaways
At the end of the study, the group A.K.A - R observed the following takeaways;

- We searched the most problamatic announcement types in our dataset with Problem Index variable which is calculated from the multiplication of the duration and effected lanes. 
We saw that within the range of minimum and maximum problem index values, infrastructure work had the largest share.
- We observed the five accomplished projects in the last three years, with the highest problem index (indicator created by the group) and affected locations. S.Yolu Z.Burnu-Bakırköy had the highest problem index. This project took approximately six months.
-   We investigated the relationship between municipality election and the number of running projects/constructions and so forth. At the end of the study we observed, strong relationship between these two factors. Such as; a sharp decrease in the number of projects carried out during the election, and a sharp increase in numbers at the post-election period.
- We checked the effect of the pandemic on the accident notifications and seen that there was a strong effect of the pandemic due to the lockdowns between March and April in 2020. 
- We showed the distribution of announcement types during holiday terms and commented on the reasons behind these announcements. It can be said that precautions should be prepared for 'accident announcement' and 'vehicle breakdown' during the holidays, and also, the municipality concentrates on maintenance work.

#### Data Sources

- [Traffic Announcements of İstanbul - İBB Open Data Portal](https://data.ibb.gov.tr/dataset/ulasim-yonetim-merkezi-uym-tarafindan-sisteme-girilen-trafik-duyurulari)
- [External Data Source - Holiday Events](https://www.tatilsepeti.com/resmi-tatil-gunleri)
- [RData File](https://github.com/pjournal/mef04g-a-k-a-r/blob/gh-pages/Project_Datasets/data.RData)

### Group Assignment

#### isbike Assignment

In this section, open source data by Istanbul Metropolitan Municipality bicycle services ISBIKE is analyzed.The data set includes Istanbul bicycle station and utilization data in text JSON format. The data shows station locations and activity status of bicycles. The purpose of the following study is the demonstrate the dynamic available bike ratio for each station on bar graph and map, using the 'shinyapp'.

- [isbike Analysis](https://aybikedilek.shinyapps.io/ISBike_Project/)


