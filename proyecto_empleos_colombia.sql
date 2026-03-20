-- ============================================================
--  PROYECTO 2: Empleos de datos por ciudad en Colombia (2026)
--  Herramienta: MySQL
--  Autor: Santiago Castillo Escobar
--  Fuentes: LinkedIn Jobs · Computrabajo · Indeed · Bumeran
--  TRM: $3.669 COP/USD · Marzo 2026
-- ============================================================

CREATE DATABASE IF NOT EXISTS proyecto_empleos_colombia;
USE proyecto_empleos_colombia;

-- ── TABLAS ──────────────────────────────────────────────────

CREATE TABLE ciudades (
    id_ciudad      INT PRIMARY KEY,
    nombre         VARCHAR(50) NOT NULL,
    departamento   VARCHAR(50) NOT NULL,
    poblacion_mill DECIMAL(4,2) NOT NULL
);

CREATE TABLE roles (
    id_rol    INT PRIMARY KEY,
    nombre    VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL
);

CREATE TABLE empleos (
    id_empleo       INT PRIMARY KEY,
    id_ciudad       INT NOT NULL,
    id_rol          INT NOT NULL,
    total_ofertas   INT NOT NULL,
    salario_cop_mes DECIMAL(12,2) NOT NULL,
    salario_usd_mes DECIMAL(8,2) NOT NULL,
    modalidad       VARCHAR(20) NOT NULL,
    herramienta_top VARCHAR(30) NOT NULL,
    fuente          VARCHAR(40) NOT NULL,
    anio            INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad),
    FOREIGN KEY (id_rol)    REFERENCES roles(id_rol)
);

CREATE TABLE herramientas (
    id_herramienta  INT PRIMARY KEY,
    nombre          VARCHAR(30) NOT NULL,
    id_ciudad       INT NOT NULL,
    total_menciones INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad)
);

-- ── DATOS ───────────────────────────────────────────────────

INSERT INTO ciudades VALUES
(1, 'Bogotá',       'Cundinamarca', 7.74),
(2, 'Medellín',     'Antioquia',    2.57),
(3, 'Cali',         'Valle',        2.23),
(4, 'Barranquilla', 'Atlántico',    1.23),
(5, 'Bucaramanga',  'Santander',    0.59),
(6, 'Remoto',       'Colombia',     0.00);

INSERT INTO roles VALUES
(1, 'Analista BI',        'Análisis'),
(2, 'Data Analyst',       'Análisis'),
(3, 'Data Engineer',      'Ingeniería'),
(4, 'Data Scientist',     'Ciencia'),
(5, 'Analytics Engineer', 'Ingeniería');

INSERT INTO empleos VALUES
(1,  1,1, 980, 4200000,1144.97,'Híbrido',   'Power BI','LinkedIn Jobs CO',2026),
(2,  1,2, 520, 3800000,1035.97,'Híbrido',   'SQL',     'Computrabajo CO', 2026),
(3,  1,3, 210, 6500000,1771.87,'Remoto',    'Python',  'Indeed CO',       2026),
(4,  1,4, 140, 7800000,2126.19,'Remoto',    'Python',  'Bumeran CO',      2026),
(5,  1,5,  90, 5900000,1608.07,'Híbrido',   'dbt',     'LinkedIn Jobs CO',2026),
(6,  2,1, 210, 3800000,1035.97,'Presencial','Power BI','Computrabajo CO', 2026),
(7,  2,2, 124, 3500000, 954.21,'Presencial','SQL',     'Indeed CO',       2026),
(8,  2,3,  68, 5800000,1580.54,'Híbrido',   'Python',  'LinkedIn Jobs CO',2026),
(9,  2,4,  42, 6900000,1880.35,'Remoto',    'Python',  'Bumeran CO',      2026),
(10, 2,5,  28, 5200000,1417.14,'Híbrido',   'dbt',     'LinkedIn Jobs CO',2026),
(11, 3,1,  89, 3200000, 872.17,'Presencial','Power BI','Computrabajo CO', 2026),
(12, 3,2,  54, 3000000, 817.93,'Presencial','Excel',   'Indeed CO',       2026),
(13, 3,3,  28, 5200000,1417.14,'Híbrido',   'Python',  'LinkedIn Jobs CO',2026),
(14, 3,4,  18, 6200000,1689.86,'Remoto',    'Python',  'Bumeran CO',      2026),
(15, 3,5,  11, 4800000,1308.53,'Híbrido',   'SQL',     'LinkedIn Jobs CO',2026),
(16, 4,1,  62, 3000000, 817.93,'Presencial','Power BI','Computrabajo CO', 2026),
(17, 4,2,  36, 2800000, 763.15,'Presencial','Excel',   'Indeed CO',       2026),
(18, 4,3,  18, 4800000,1308.53,'Híbrido',   'Python',  'LinkedIn Jobs CO',2026),
(19, 4,4,  10, 5800000,1580.54,'Remoto',    'Python',  'Bumeran CO',      2026),
(20, 4,5,   6, 4200000,1144.97,'Híbrido',   'SQL',     'LinkedIn Jobs CO',2026),
(21, 5,1,  42, 2900000, 790.41,'Presencial','Power BI','Computrabajo CO', 2026),
(22, 5,2,  25, 2700000, 735.89,'Presencial','Excel',   'Indeed CO',       2026),
(23, 5,3,  12, 4600000,1253.75,'Híbrido',   'Python',  'LinkedIn Jobs CO',2026),
(24, 5,4,   8, 5500000,1499.32,'Remoto',    'Python',  'Bumeran CO',      2026),
(25, 5,5,   4, 4000000,1090.54,'Híbrido',   'SQL',     'LinkedIn Jobs CO',2026),
(26, 6,1, 180, 5500000,1499.32,'Remoto',    'Power BI','LinkedIn Jobs CO',2026),
(27, 6,2, 120, 5000000,1362.77,'Remoto',    'SQL',     'Indeed CO',       2026),
(28, 6,3,  95, 7500000,2044.16,'Remoto',    'Python',  'LinkedIn Jobs CO',2026),
(29, 6,4,  65, 8500000,2317.53,'Remoto',    'Python',  'Bumeran CO',      2026),
(30, 6,5,  45, 6500000,1771.87,'Remoto',    'dbt',     'LinkedIn Jobs CO',2026);

INSERT INTO herramientas VALUES
(1, 'Power BI',1,1420),(2, 'SQL',1,1180),(3, 'Python',1,980),
(4, 'Excel',1,760),(5, 'Azure',1,540),(6, 'Power BI',2,380),
(7, 'SQL',2,290),(8, 'Python',2,210),(9, 'Excel',2,180),
(10,'Tableau',2,120),(11,'Power BI',3,180),(12,'Excel',3,160),
(13,'SQL',3,140),(14,'Python',3,90),(15,'Power BI',4,140),
(16,'Excel',4,120),(17,'SQL',4,98),(18,'Python',4,65),
(19,'Power BI',5,98),(20,'Excel',5,86),(21,'SQL',5,72),
(22,'Python',5,48),(23,'Python',6,380),(24,'SQL',6,320),
(25,'Power BI',6,280),(26,'dbt',6,210),(27,'Azure',6,180);

-- ── CONSULTAS DE ANÁLISIS ────────────────────────────────────

-- CONSULTA 1: Total empleos por ciudad
SELECT
    c.nombre AS ciudad,
    SUM(e.total_ofertas) AS total_empleos,
    ROUND(AVG(e.salario_cop_mes),0) AS promedio_cop,
    ROUND(AVG(e.salario_usd_mes),0) AS promedio_usd
FROM empleos e
JOIN ciudades c ON e.id_ciudad = c.id_ciudad
GROUP BY c.nombre
ORDER BY total_empleos DESC;

-- CONSULTA 2: Rol más demandado por ciudad
SELECT
    c.nombre AS ciudad,
    r.nombre AS rol,
    SUM(e.total_ofertas) AS ofertas
FROM empleos e
JOIN ciudades c ON e.id_ciudad = c.id_ciudad
JOIN roles r ON e.id_rol = r.id_rol
GROUP BY c.nombre, r.nombre
ORDER BY ciudad, ofertas DESC;

-- CONSULTA 3: Salario por modalidad en COP y USD
SELECT
    modalidad,
    ROUND(AVG(salario_cop_mes),0) AS promedio_cop,
    ROUND(AVG(salario_usd_mes),0) AS promedio_usd,
    SUM(total_ofertas) AS total_empleos
FROM empleos
GROUP BY modalidad
ORDER BY promedio_usd DESC;

-- CONSULTA 4: Herramienta más pedida por ciudad
SELECT
    c.nombre AS ciudad,
    h.nombre AS herramienta,
    h.total_menciones
FROM herramientas h
JOIN ciudades c ON h.id_ciudad = c.id_ciudad
WHERE h.total_menciones = (
    SELECT MAX(h2.total_menciones)
    FROM herramientas h2
    WHERE h2.id_ciudad = h.id_ciudad
)
ORDER BY h.total_menciones DESC;

-- CONSULTA 5: Ranking ciudades por salario USD
SELECT
    c.nombre AS ciudad,
    ROUND(AVG(e.salario_usd_mes),0) AS promedio_usd,
    ROUND(AVG(e.salario_cop_mes),0) AS promedio_cop,
    RANK() OVER (ORDER BY AVG(e.salario_usd_mes) DESC) AS ranking
FROM empleos e
JOIN ciudades c ON e.id_ciudad = c.id_ciudad
GROUP BY c.nombre
ORDER BY ranking;
