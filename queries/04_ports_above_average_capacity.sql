-- ============================================================
-- Query 04
-- Ports with capacity above the global average
--
-- Retrieves the switch ports whose maximum installed capacity
-- is higher than the average capacity across all ports in the
-- system. This highlights higher-capacity infrastructure compared
-- to the overall deployment baseline.
-- ============================================================


SELECT p.*
FROM Porte_Switch AS p
WHERE p.capacita_max_gbps > (
    SELECT AVG(p2.capacita_max_gbps)
	FROM Porte_Switch AS p2
);