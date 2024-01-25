#win per year
CREATE VIEW v_win_year AS
    SELECT 
        match_year, home_team AS teams, SUM(home_win) AS total_win
    FROM
        (SELECT 
            YEAR(matchdate) AS match_year,
                home_team,
                SUM(CASE
                    WHEN home_score > away_score THEN 1
                    ELSE 0
                END) AS home_win
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations'
        GROUP BY match_year , home_team UNION ALL SELECT 
            YEAR(matchdate) AS match_year,
                away_team,
                SUM(CASE
                    WHEN away_score > home_score THEN 1
                    ELSE 0
                END) AS away_win
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations'
        GROUP BY match_year , away_team) AS a
    GROUP BY match_year , home_team
    ORDER BY match_year , total_win DESC;

#lose per year
CREATE VIEW v_lose_year AS
    SELECT 
        match_year, home_team AS teams, SUM(home_lose) AS total_lose
    FROM
        (SELECT 
            YEAR(matchdate) AS match_year,
                home_team,
                SUM(CASE
                    WHEN home_score < away_score THEN 1
                    ELSE 0
                END) AS home_lose
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations'
        GROUP BY match_year , home_team UNION ALL SELECT 
            YEAR(matchdate) AS match_year,
                away_team,
                SUM(CASE
                    WHEN away_score < home_score THEN 1
                    ELSE 0
                END) AS away_lose
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations'
        GROUP BY match_year , away_team) AS a
    GROUP BY match_year , home_team
    ORDER BY match_year , total_lose DESC;

#draw per year
CREATE VIEW v_draw_year AS
    SELECT 
        match_year, home_team AS teams, SUM(home_draw) AS total_draw
    FROM
        (SELECT 
            YEAR(matchdate) AS match_year,
                home_team,
                SUM(CASE
                    WHEN home_score = away_score THEN 1
                    ELSE 0
                END) AS home_draw
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations'
        GROUP BY match_year , home_team UNION ALL SELECT 
            YEAR(matchdate) AS match_year,
                away_team,
                SUM(CASE
                    WHEN away_score = home_score THEN 1
                    ELSE 0
                END) AS away_draw
        FROM
            african_nations_results_clean
        WHERE
            tournament = 'african cup of nations'
        GROUP BY match_year , away_team) AS a
    GROUP BY match_year , home_team
    ORDER BY match_year , total_draw DESC;
