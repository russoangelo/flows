-- ============================================================
-- Query 03
-- ISPs with at least one high-traffic spike (> 500 Gbps)
--
-- Retrieves the names of ISPs that have at least one hourly
-- traffic measurement exceeding 500 Gbps on any of their ports.
-- ============================================================

SELECT DISTINCT i.nome AS isp_name
FROM ISP AS i
JOIN Porte_Switch AS p
ON i.id_isp = p.id_isp
JOIN Traffico_Orario AS t
ON p.id_porta = t.id_porta
WHERE t.gbps_in_uscita > 500;