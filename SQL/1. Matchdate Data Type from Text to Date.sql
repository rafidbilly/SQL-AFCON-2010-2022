-- fixing the matchdate data type from text to date
SELECT  STR_TO_DATE(matchdate, '%m/%d/%Y')
FROM african_nations_results;

CREATE TABLE african_nations_results_clean(
	matchdate DATE,
    home_team text,
    away_team text,
    home_score int DEFAULT NULL,
    away_score int DEFAULT NULL,
    tournament text
	);

INSERT INTO african_nations_results_clean
	SELECT  STR_TO_DATE(matchdate, '%m/%d/%Y'), 
    home_team,
    away_team,
    home_score,
    away_score,
    tournament
    FROM african_nations_results;
 
SELECT * FROM african_nations_results_clean;
