-- 1. CREAZIONE DELLE TABELLE (DDL)
CREATE TABLE ISP (
    id_isp INT PRIMARY KEY,
    nome VARCHAR(50),
    nazione VARCHAR(50),
    tipo VARCHAR(20) -- 'Content' (es. Netflix), 'Access' (es. TIM)
);

CREATE TABLE Porte_Switch (
    id_porta INT PRIMARY KEY,
    id_isp INT,
    capacita_max_gbps INT,
    FOREIGN KEY (id_isp) REFERENCES ISP(id_isp)
);

CREATE TABLE Traffico_Orario (
    id_rilevazione INT PRIMARY KEY,
    id_porta INT,
    timestamp_ora DATETIME,
    gbps_in_uscita DECIMAL(10,2),
    FOREIGN KEY (id_porta) REFERENCES Porte_Switch(id_porta)
);

-- 2. INSERIMENTO DATI (DML)

-- Popolamento ISP
INSERT INTO ISP VALUES (1, 'TIM', 'Italia', 'Access');
INSERT INTO ISP VALUES (2, 'Vodafone IT', 'Italia', 'Access');
INSERT INTO ISP VALUES (3, 'Netflix', 'USA', 'Content');
INSERT INTO ISP VALUES (4, 'Google', 'USA', 'Content');
INSERT INTO ISP VALUES (5, 'Akamai', 'USA', 'Content');
INSERT INTO ISP VALUES (6, 'Iliad', 'Francia', 'Access');

-- Popolamento Porte (alcuni ISP hanno più porte per ridondanza)
INSERT INTO Porte_Switch VALUES (101, 1, 100); -- TIM
INSERT INTO Porte_Switch VALUES (102, 1, 100); -- TIM (Porta 2)
INSERT INTO Porte_Switch VALUES (201, 2, 100); -- Vodafone
INSERT INTO Porte_Switch VALUES (301, 3, 400); -- Netflix (Porta ad alta capacità)
INSERT INTO Porte_Switch VALUES (401, 4, 400); -- Google
INSERT INTO Porte_Switch VALUES (601, 6, 100); -- Iliad

-- Popolamento Traffico (Simulazione picco serale ore 21:00 e 22:00)
-- Dati per TIM (id_isp 1, porte 101 e 102)
INSERT INTO Traffico_Orario VALUES (1, 101, '2023-10-25 21:00:00', 85.50);
INSERT INTO Traffico_Orario VALUES (2, 102, '2023-10-25 21:00:00', 70.20);
-- Dati per Netflix (id_isp 3, porta 301)
INSERT INTO Traffico_Orario VALUES (3, 301, '2023-10-25 21:00:00', 310.00);
INSERT INTO Traffico_Orario VALUES (4, 301, '2023-10-25 22:00:00', 350.50);
-- Dati per Google (id_isp 4, porta 401)
INSERT INTO Traffico_Orario VALUES (5, 401, '2023-10-25 21:00:00', 210.00);
INSERT INTO Traffico_Orario VALUES (6, 401, '2023-10-25 22:00:00', 195.00);
-- Dati per Iliad (id_isp 6, porta 601)
INSERT INTO Traffico_Orario VALUES (7, 601, '2023-10-25 21:00:00', 45.00);