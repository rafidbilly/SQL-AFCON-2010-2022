#total goals (home and away) per year
CREATE VIEW v_total_goals_year AS
    SELECT 
        match_year, teams, SUM(score) AS total_score
    FROM
        (SELECT 
            YEAR(matchdate) AS match_year,
                home_team AS teams,
                home_score AS score
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations' UNION ALL SELECT 
            YEAR(matchdate) AS match_year, away_team, away_score
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations') AS a
    GROUP BY match_year , teams
    ORDER BY match_year , total_score DESC;
    
#total conceded per year
CREATE VIEW v_total_conceded_year AS
    SELECT 
        match_year, teams, SUM(conceded) AS total_goals_conceded
    FROM
        (SELECT 
            YEAR(matchdate) AS match_year,
                home_team AS teams,
                away_score AS conceded
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations' UNION ALL SELECT 
            YEAR(matchdate) AS match_year, away_team, home_score
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations') AS c
    GROUP BY teams , match_year
    ORDER BY match_year , total_goals_conceded DESC;

#total goals and conceded per year
SELECT 
    gy.match_year,
    gy.teams,
    gy.total_score,
    cy.total_goals_conceded,
    (gy.total_score - cy.total_goals_conceded) AS goal_dif
FROM
    v_total_goals_year gy
        JOIN
    v_total_conceded_year cy ON gy.teams = cy.teams
        AND gy.match_year = cy.match_year;



