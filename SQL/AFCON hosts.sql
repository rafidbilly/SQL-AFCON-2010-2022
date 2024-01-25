SELECT DISTINCT
    YEAR(matchdate)
FROM
    african_nations_results_clean
WHERE
    tournament = 'african cup of nations';
    
CREATE TABLE afcon_host (
	hostyear INT,
    host_team VARCHAR(255)
);

ALTER TABLE afcon_host
DROP COLUMN host_team_2;

SELECT * FROM afcon_host;

INSERT INTO afcon_host(hostyear, host_team)
VALUES
(2010, 'Angola'),
(2012, 'Equatorial Guinea'),
(2012, 'Gabon'),
(2013, 'South Africa'),
(2015, 'Equatorial Guinea'),
(2017, 'Gabon'),
(2019, 'Egypt'),
(2022, 'Cameroon');