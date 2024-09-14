-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2024 at 07:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dwi`
--

-- --------------------------------------------------------

--
-- Table structure for table `personas_abril_2024`
--

CREATE TABLE `personas_abril_2024` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_abril_2024`
--

INSERT INTO `personas_abril_2024` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(1, '1', '1', '40470006', 'JOSE EUFEVIO', 'CASTRO', 'LIMAYLLA'),
(2, '1', '9', '40470007', 'SONIA MADELEINE', 'TATAJE', 'DE LA CRUZ'),
(3, '1', '', '40470008', 'MIRKO CARLOS', 'QUIÑONES', 'SPADARO'),
(4, '1', '5', '40470009', 'LUZ MARINA', 'GARCIA', 'VELIT'),
(5, '1', '', '40470010', 'MARIA ESTHER', 'CARDENAS', 'CHUMPITAZ'),
(6, '1', '1', '40474511', 'FERNANDO', 'RIOS', 'CAHUAZA');

-- --------------------------------------------------------

--
-- Table structure for table `personas_agosto_2024`
--

CREATE TABLE `personas_agosto_2024` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_agosto_2024`
--

INSERT INTO `personas_agosto_2024` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(1, '1', '7', '40470199', 'JULIANA SARITA', 'MOYANO', 'CAYCHO'),
(2, '1', '9', '40470198', 'VICTOR HERMINIO', 'ESPINOZA', 'ROJAS'),
(3, '1', '1', '40470197', 'ELIA', 'TORRES', 'ROMERO'),
(4, '1', '2', '40470196', 'ROBERT FERNANDO', 'MAMANI', 'JESUS'),
(5, '1', '4', '40470195', 'JUAN ANTONIO', 'HUAMALI', 'CHUNQUI');

-- --------------------------------------------------------

--
-- Table structure for table `personas_enero_2024`
--

CREATE TABLE `personas_enero_2024` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_enero_2024`
--

INSERT INTO `personas_enero_2024` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(226, '1', '', '73997130', 'JOSUE ABRAHAN', 'BARRETO', 'SAAVEDRA'),
(227, '1', '7', '71489805', 'OMALY ANDRES', 'AGUILAR', 'REGALADO'),
(228, '1', '1', '40474489', 'LIDIA ROXANA', 'LOPEZ', 'BURGOS'),
(229, '1', '3', '71389805', 'YARLY ARELI', 'APONTE', 'DAVALOS'),
(230, '1', '', '71449805', 'ANGEL AYMER', 'ALVARADO', 'TAFUR'),
(231, '1', '3', '40474529', 'MARIA ROXANA', 'AGUILAR', 'DE LOS SANTOS');

-- --------------------------------------------------------

--
-- Table structure for table `personas_febrero_2024`
--

CREATE TABLE `personas_febrero_2024` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_febrero_2024`
--

INSERT INTO `personas_febrero_2024` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(1, '1', '9', '40473456', 'LIDER', 'TORRES', 'MOZOMBITE'),
(2, '1', '1', '40470000', 'YESENIA MAGDALENA', 'GAMARRA', 'CASTRO'),
(3, '1', '0', '40470001', 'DAVID FELIPE', 'SIFUENTES', 'MANRIQUE'),
(4, '1', '8', '40470002', 'FELIX MIGUEL', 'VALDEZ', 'VELAOCHAGA'),
(5, '1', '6', '40470003', 'GONZALO', 'TAFUR', 'VEGA'),
(6, '1', '4', '40470004', 'SUIBERTO', 'HIDALGO', 'NUÑEZ'),
(7, '1', '2', '40470005', 'ALEX SCOT', 'VILLANUEVA', 'VILLANUEVA');

-- --------------------------------------------------------

--
-- Table structure for table `personas_febrero_2025`
--

CREATE TABLE `personas_febrero_2025` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_febrero_2025`
--

INSERT INTO `personas_febrero_2025` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(13, '1', '', '40470193', 'MARIA JULIA', 'LOPEZ', 'NAVARRO'),
(14, '1', '6', '40470194', 'SARA LOURDES', 'SILVA', 'ZEGARRA'),
(15, '1', '0', '40470189', 'EDUARDO', 'PAREDES', 'PERALTA'),
(16, '1', '1', '40470188', 'OSCAR MOISES', 'ALTAMIZA', 'BUSTAMANTE'),
(17, '1', '5', '40470186', 'JONNY ROGER', 'ARIAS', 'CASTELLANO'),
(18, '1', '7', '40470185', 'EDGAR FREDY', 'MEZA', 'PEÑA');

-- --------------------------------------------------------

--
-- Table structure for table `personas_julio_2024`
--

CREATE TABLE `personas_julio_2024` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_julio_2024`
--

INSERT INTO `personas_julio_2024` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(1, '1', '4', '40470181', 'FELIPE', 'SAAVEDRA', 'BAZAN'),
(2, '1', '6', '40470180', 'FILOMENA', 'LOPEZ', 'RAMOS'),
(3, '1', '', '40470179', 'YAHAIRA PAOLA', 'LAPA', 'FIGUEROA'),
(4, '1', '1', '40470174', 'NILTON CESAR', 'BECERRA', 'ESPINOZA'),
(5, '1', '3', '40470173', 'SANTIAGO MIGUEL', 'FUMAGALLI', 'PASTORI');

-- --------------------------------------------------------

--
-- Table structure for table `personas_junio_2024`
--

CREATE TABLE `personas_junio_2024` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_junio_2024`
--

INSERT INTO `personas_junio_2024` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(1, '1', '', '40470168', 'NORMA', 'AMANQUI', 'MAMANI'),
(2, '1', '9', '40470167', 'ESTHER', 'ACUÑA', 'VALLE'),
(3, '1', '1', '40470166', 'SONIA FERNANDINA', 'CANCHUA', 'GUILLEN'),
(4, '1', '2', '40470165', 'ISMAEL JULIO ALBERTO', 'DULANTO', 'VEGA'),
(5, '1', '', '40470164', 'HILDA', 'TICONA', 'ARIZANCA'),
(6, '1', '6', '40470163', 'GLORIA ELIZABETH', 'LEVANO', 'OSORIO');

-- --------------------------------------------------------

--
-- Table structure for table `personas_marzo_2024`
--

CREATE TABLE `personas_marzo_2024` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_marzo_2024`
--

INSERT INTO `personas_marzo_2024` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(1, '1', '8', '40470162', 'ZENON ALBERTO', 'SALVATIERRA', 'ALLAUCA'),
(2, '1', '0', '40470161', 'DE MONTEZA BRENDA MARIA', 'SALGADO', 'RIOFRIO'),
(3, '1', '', '40470157', 'DAVID CESAR', 'REINA', 'VEGA'),
(4, '1', '3', '40470156', 'JULIO CESAR', 'JIMENEZ', 'SOTO'),
(5, '1', '5', '40470155', 'JUNO INDIRA EMPERATRIZ', 'MANSILLA', 'FLOREZ'),
(6, '1', '7', '40470154', 'GERMAN', 'GOMEZ', 'BUSTAMANTE');

-- --------------------------------------------------------

--
-- Table structure for table `personas_mayo_2024`
--

CREATE TABLE `personas_mayo_2024` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_mayo_2024`
--

INSERT INTO `personas_mayo_2024` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(1, '1', '6', '40470146', 'MARIANA', 'MONGE', 'VARGAS'),
(2, '1', '8', '40470145', 'REYNALDO', 'HUISA', 'GAVANCHO'),
(3, '1', '', '40470142', 'CLAUDIO CESAR', 'PANTALEON', 'FLORES'),
(4, '1', '5', '40470141', 'SANTIAGO VICTOR', 'VEGA', 'OBREGON'),
(5, '1', '7', '40470140', 'DAVID ANDRES', 'CATALAN', 'PALOMINO'),
(6, '1', '1', '40470149', 'ADRIAN', 'ZUBIAGA', 'MARQUEZ');

-- --------------------------------------------------------

--
-- Table structure for table `personas_septiembre_2024`
--

CREATE TABLE `personas_septiembre_2024` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `digitoVerificador` varchar(10) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas_septiembre_2024`
--

INSERT INTO `personas_septiembre_2024` (`id`, `tipoDocumento`, `digitoVerificador`, `dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`) VALUES
(1, '1', '8', '40470114', 'VERONICA', 'MERE', 'PACHECO'),
(2, '1', '0', '40470113', 'LAURA', 'ENCISO', 'INFANTES'),
(3, '1', '3', '40470108', 'ROBERTO ELIAS', 'SIMEON', 'SANTOS'),
(4, '1', '2', '40470098', 'HENRY EDUARDO', 'HUILLCA', 'SOLIS'),
(5, '1', '1', '40470093', 'KATHERINE SUSSAN', 'GARCIA', 'ARMAS'),
(6, '1', '', '40470084', 'PABLO WUILLAM', 'PIÑAS', 'DAMIAN'),
(7, '1', '2', '00000000', 'IMPOSTOR', 'IMPOSTOR', 'IMPOSTOR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `personas_abril_2024`
--
ALTER TABLE `personas_abril_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- Indexes for table `personas_agosto_2024`
--
ALTER TABLE `personas_agosto_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- Indexes for table `personas_enero_2024`
--
ALTER TABLE `personas_enero_2024`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indexes for table `personas_febrero_2024`
--
ALTER TABLE `personas_febrero_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- Indexes for table `personas_febrero_2025`
--
ALTER TABLE `personas_febrero_2025`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- Indexes for table `personas_julio_2024`
--
ALTER TABLE `personas_julio_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- Indexes for table `personas_junio_2024`
--
ALTER TABLE `personas_junio_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- Indexes for table `personas_marzo_2024`
--
ALTER TABLE `personas_marzo_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- Indexes for table `personas_mayo_2024`
--
ALTER TABLE `personas_mayo_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- Indexes for table `personas_septiembre_2024`
--
ALTER TABLE `personas_septiembre_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `personas_abril_2024`
--
ALTER TABLE `personas_abril_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personas_agosto_2024`
--
ALTER TABLE `personas_agosto_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personas_enero_2024`
--
ALTER TABLE `personas_enero_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `personas_febrero_2024`
--
ALTER TABLE `personas_febrero_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personas_febrero_2025`
--
ALTER TABLE `personas_febrero_2025`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personas_julio_2024`
--
ALTER TABLE `personas_julio_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personas_junio_2024`
--
ALTER TABLE `personas_junio_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personas_marzo_2024`
--
ALTER TABLE `personas_marzo_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personas_mayo_2024`
--
ALTER TABLE `personas_mayo_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personas_septiembre_2024`
--
ALTER TABLE `personas_septiembre_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
