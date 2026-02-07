-- ============================================================
-- Query 02
-- Active ports and total installed capacity per country
--
-- Counts how many switch ports are currently active (i.e. have
-- at least one traffic record) and sums their installed capacity,
-- grouped by the ISP country.
-- ============================================================

SELECT i.nome, COUNT(DISTINCT p.id_porta), SUM(p.capacita_max_gbps) AS maximum_gbps
FROM ISP AS i
JOIN Porte_Switch AS p
ON i.id_isp = p.id_isp
GROUP BY i.nome
ORDER BY maximum_gbps DESC;