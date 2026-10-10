SELECT version, COUNT(*)  AS player_cnt
From players
GROUP BY version
ORDER BY player_cnt DESC;

-- Сколько игроков в каждой группе
SELECT version, COUNT(*) AS player_cnt
FROM players
GROUP BY version
ORDER BY player_cnt DESC;

-- Среднее количество сыгранных раундов по группам
SELECT version, AVG(sum_gamerounds) AS avg_rounds
FROM players
GROUP BY version
ORDER BY avg_rounds DESC;

-- Retention 1-го дня по группам (%)
SELECT version, ROUND(AVG(retention_1::int) * 100, 2) AS retention_1_pct
FROM players
GROUP BY version
ORDER BY retention_1_pct DESC;

-- Retention 7-го дня по группам (%)
SELECT version, ROUND(AVG(retention_7::int) * 100, 2) AS retention_7_pct
FROM players
GROUP BY version
ORDER BY retention_7_pct DESC;