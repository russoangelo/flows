-- ============================================================
-- Query 05
-- Content ISPs exceeding the MIX average traffic at a given time
--
-- Identifies ISPs of type 'Content' whose total outgoing traffic
-- (summed across all their ports) at a specific hour exceeds the
-- overall average traffic of the MIX during that same hour.
--
-- This highlights major content providers generating above-baseline
-- traffic compared to the exchange-wide average at a given moment.
-- ============================================================

SELECT i.nome, SUM(t.gbps_in_uscita)
FROM ISP AS i
JOIN Porte_Switch AS p 
ON i.id_isp = p.id_isp
JOIN Traffico_Orario AS t
ON p.id_porta = t.id_porta
WHERE i.tipo = 'Content'
GROUP BY i.nome, t.timestamp_ora
HAVING SUM(t.gbps_in_uscita) > (
    SELECT AVG(t1.gbps_in_uscita)
    FROM Traffico_Orario AS t1
    WHERE t1.timestamp_ora = t.timestamp_ora
)