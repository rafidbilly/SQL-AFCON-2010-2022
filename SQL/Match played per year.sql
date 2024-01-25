#matches per year
CREATE VIEW v_matches_year AS
    SELECT 
        match_year,
        home_team AS teams,
        SUM(count_home_match) AS total_matches
    FROM
        (SELECT 
            YEAR(matchdate) AS match_year,
                home_team,
                COUNT(*) AS count_home_match
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations'
        GROUP BY match_year , home_team UNION ALL SELECT 
            YEAR(matchdate) AS match_year,
                away_team,
                COUNT(*) AS count_away_match
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations'
        GROUP BY match_year , away_team) AS a
    GROUP BY match_year , home_team
    ORDER BY match_year , total_matches DESC;
