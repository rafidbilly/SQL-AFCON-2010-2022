#matches, win, draw, lose
SELECT
	m.match_year,
    m.teams,
    m.total_matches,
    w.total_win,
    d.total_draw,
    l.total_lose,
    (w.total_win/m.total_matches)*100 AS matches_winrate
FROM
	v_matches_year m
		JOIN
	v_win_year w ON m.teams = w.teams AND m.match_year = w.match_year
		JOIN
	v_draw_year d ON w.teams = d.teams AND w.match_year = d.match_year
		JOIN
	v_lose_year l ON d.teams = l.teams AND d.match_year = l.match_year
ORDER BY match_year ASC, matches_winrate DESC;

#complete table
SELECT 
    m.match_year,
    m.teams,
    m.total_matches,
    w.total_win,
    d.total_draw,
    l.total_lose,
    gy.total_score,
    cy.total_goals_conceded,
    (gy.total_score - cy.total_goals_conceded) AS goal_dif,
	(w.total_win / m.total_matches) * 100 AS matches_winrate,
    ac.champion
FROM
    v_matches_year m
        JOIN
    v_win_year w ON m.teams = w.teams
        AND m.match_year = w.match_year
        JOIN
    v_draw_year d ON w.teams = d.teams
        AND w.match_year = d.match_year
        JOIN
    v_lose_year l ON d.teams = l.teams
        AND d.match_year = l.match_year
        JOIN
    v_total_goals_year gy ON l.teams = gy.teams
        AND l.match_year = gy.match_year
        JOIN
    v_total_conceded_year cy ON gy.teams = cy.teams
        AND gy.match_year = cy.match_year
        JOIN
	afcon_champion ac ON cy.match_year = ac.tournament_year
ORDER BY match_year ASC , matches_winrate DESC;
