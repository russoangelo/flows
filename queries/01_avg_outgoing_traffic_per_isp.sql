-- ============================================================
-- Query 01
-- Average outgoing traffic per ISP
--
-- Calculates the mean outbound traffic (Gbps) for each ISP
-- across all its connected switch ports and recorded timestamps.
-- Results are ordered from highest to lowest average traffic.
-- ============================================================

SELECT i.nome, AVG(t.gbps_in_uscita) AS media
FROM ISP AS i
JOIN Porte_Switch AS p
ON i.id_isp = p.id_isp
JOIN Traffico_Orario AS t
ON p.id_porta = t.id_porta
GROUP BY i.nome
ORDER BY media DESC