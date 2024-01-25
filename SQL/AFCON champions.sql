SELECT DISTINCT
    YEAR(matchdate)
FROM
    african_nations_results_clean
WHERE
    tournament = 'african cup of nations';

CREATE TABLE afcon_champion(
	tournament_year INT,
    champion VARCHAR(255),
    runner_up VARCHAR(255),
    third VARCHAR(255));

SELECT * FROM afcon_champion;

INSERT INTO afcon_champion
VALUES 
	(2010, 'Egypt', 'Ghana', 'Nigeria'),
    (2012, 'Zambia', 'Ivory Coast', 'Mali'),
    (2013, 'Nigeria', 'Burkina Faso', 'Mali'),
    (2015, 'Ivory Coast', 'Ghana', 'DR Congo'),
    (2017, 'Cameroon', 'Egypt', 'Burkina Faso'),
    (2019, 'Algeria', 'Senegal', 'Nigeria'),
    (2022, 'Senegal', 'Egypt', 'Cameroon');
    
TRUNCATE TABLE afcon_champion;