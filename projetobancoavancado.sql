-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2023 at 02:51 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projetobancoavancado`
--

-- --------------------------------------------------------

--
-- Table structure for table `estoq_montagem`
--

CREATE TABLE `estoq_montagem` (
  `id` int(11) NOT NULL,
  `luva_tatica` int(10) DEFAULT NULL,
  `butina_normal` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `estoq_pintura`
--

CREATE TABLE `estoq_pintura` (
  `id` int(11) NOT NULL,
  `macacao` int(10) DEFAULT NULL,
  `mascara` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `estoq_usinagem`
--

CREATE TABLE `estoq_usinagem` (
  `id` int(11) NOT NULL,
  `luva_raspa` int(10) DEFAULT NULL,
  `butina_especial` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sesmit`
--

CREATE TABLE `sesmit` (
  `id` int(11) NOT NULL,
  `estoq_usinagem_fk` int(11) DEFAULT NULL,
  `estoq_pintura_fk` int(11) DEFAULT NULL,
  `estoq_montagem_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setor_montagem`
--

CREATE TABLE `setor_montagem` (
  `id` int(11) NOT NULL,
  `num_funcionarios` int(25) DEFAULT NULL,
  `luva_tatica` int(25) DEFAULT NULL,
  `butina_normal` int(25) DEFAULT NULL,
  `estoq_fk` int(11) DEFAULT NULL,
  `sesmit_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setor_pintura`
--

CREATE TABLE `setor_pintura` (
  `id` int(11) NOT NULL,
  `num_funcionarios` int(25) DEFAULT NULL,
  `macacao` int(25) DEFAULT NULL,
  `mascara` int(25) DEFAULT NULL,
  `estoq_fk` int(11) DEFAULT NULL,
  `sesmit_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setor_usinagem`
--

CREATE TABLE `setor_usinagem` (
  `id` int(11) NOT NULL,
  `num_funcionarios` int(25) DEFAULT NULL,
  `luva_raspa` int(25) DEFAULT NULL,
  `butina_especial` int(25) DEFAULT NULL,
  `estoq_fk` int(11) DEFAULT NULL,
  `sesmit_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `estoq_montagem`
--
ALTER TABLE `estoq_montagem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estoq_pintura`
--
ALTER TABLE `estoq_pintura`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estoq_usinagem`
--
ALTER TABLE `estoq_usinagem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sesmit`
--
ALTER TABLE `sesmit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estoq_usinagem_fk` (`estoq_usinagem_fk`),
  ADD KEY `estoq_pintura_fk` (`estoq_pintura_fk`),
  ADD KEY `estoq_montagem_fk` (`estoq_montagem_fk`);

--
-- Indexes for table `setor_montagem`
--
ALTER TABLE `setor_montagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estoq_fk` (`estoq_fk`),
  ADD KEY `sesmit_fk` (`sesmit_fk`);

--
-- Indexes for table `setor_pintura`
--
ALTER TABLE `setor_pintura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estoq_fk` (`estoq_fk`),
  ADD KEY `sesmit_fk` (`sesmit_fk`);

--
-- Indexes for table `setor_usinagem`
--
ALTER TABLE `setor_usinagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estoq_fk` (`estoq_fk`),
  ADD KEY `sesmit_fk` (`sesmit_fk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sesmit`
--
ALTER TABLE `sesmit`
  ADD CONSTRAINT `sesmit_ibfk_1` FOREIGN KEY (`estoq_usinagem_fk`) REFERENCES `estoq_usinagem` (`id`),
  ADD CONSTRAINT `sesmit_ibfk_2` FOREIGN KEY (`estoq_pintura_fk`) REFERENCES `estoq_pintura` (`id`),
  ADD CONSTRAINT `sesmit_ibfk_3` FOREIGN KEY (`estoq_montagem_fk`) REFERENCES `estoq_montagem` (`id`);

--
-- Constraints for table `setor_montagem`
--
ALTER TABLE `setor_montagem`
  ADD CONSTRAINT `setor_montagem_ibfk_1` FOREIGN KEY (`estoq_fk`) REFERENCES `estoq_montagem` (`id`),
  ADD CONSTRAINT `setor_montagem_ibfk_2` FOREIGN KEY (`sesmit_fk`) REFERENCES `sesmit` (`id`);

--
-- Constraints for table `setor_pintura`
--
ALTER TABLE `setor_pintura`
  ADD CONSTRAINT `setor_pintura_ibfk_1` FOREIGN KEY (`estoq_fk`) REFERENCES `estoq_pintura` (`id`),
  ADD CONSTRAINT `setor_pintura_ibfk_2` FOREIGN KEY (`sesmit_fk`) REFERENCES `sesmit` (`id`);

--
-- Constraints for table `setor_usinagem`
--
ALTER TABLE `setor_usinagem`
  ADD CONSTRAINT `setor_usinagem_ibfk_1` FOREIGN KEY (`estoq_fk`) REFERENCES `estoq_usinagem` (`id`),
  ADD CONSTRAINT `setor_usinagem_ibfk_2` FOREIGN KEY (`sesmit_fk`) REFERENCES `sesmit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
