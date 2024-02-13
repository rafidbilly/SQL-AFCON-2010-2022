I got this Aftican National Football Matches 2010-2024 file from kaggle https://www.kaggle.com/datasets/oussamalariouch/african-national-football-from-2010-2024

the dataset includes the following columns:  
  date - date of the match  
  home_team - the name of the home team  
  away_team - the name of the away team  
  home_score - full-time home team score including extra time, not including penalty-shootouts  
  away_score - full-time away team score including extra time, not including penalty-shootouts  
  Tournament - the name of the tournament  
However I changed the column "date" to "matchdate" to avoid confusion in MySQL.  

The aim of this SQL project is to get the statistics of the teams who competed in Africa Cup of Nations (AFCON) 2010-2022.
The statistics include:  
  -Year participated  
  -Number of matches played  
  -Total wins, losses, and draws  
  -Goals scored and conceded  
  -Goal difference  

Then I visualize the data to tableau https://public.tableau.com/app/profile/rafid.billy/viz/AFCON2010-2024/Dashboard1
