-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2024 at 05:08 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `ID` int(11) NOT NULL,
  `NIK` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `TglLahir` date NOT NULL,
  `Alamat` text NOT NULL,
  `NoTelp` varchar(255) NOT NULL,
  `TglRegistrasi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`ID`, `NIK`, `NamaLengkap`, `TglLahir`, `Alamat`, `NoTelp`, `TglRegistrasi`) VALUES
(14, 'JIOPQWSHGAVH XGUIOIXHJBVZH', 'Moh. Aliiffil Qodri Vanoza Araby', '0000-00-00', 'Jalan Danau Ranau VIII G7A No 13, Kedungkandang, Sawojajar, Kota Malang', '082111016617', '2024-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `ID` int(11) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  `Judul` varchar(255) NOT NULL,
  `Pengarang` varchar(25) NOT NULL,
  `Kategori_ID` int(11) NOT NULL,
  `Penerbit_ID` int(11) NOT NULL,
  `Deskripsi` text NOT NULL,
  `Stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`ID`, `ISBN`, `Judul`, `Pengarang`, `Kategori_ID`, `Penerbit_ID`, `Deskripsi`, `Stok`) VALUES
(25, '890240', 's', 's', 9, 12, 'hai', 1),
(26, '12345', 'Pokemon', 'Al', 9, 12, '1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detailpeminjaman`
--

CREATE TABLE `detailpeminjaman` (
  `ID` int(11) NOT NULL,
  `Peminjaman_ID` int(11) NOT NULL,
  `Buku_ID` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `ID` int(11) NOT NULL,
  `NamaKategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`ID`, `NamaKategori`) VALUES
(9, 'Aksi');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID` int(11) NOT NULL,
  `Anggota_ID` int(11) NOT NULL,
  `TglPinjam` date NOT NULL,
  `JadwalKembali` date NOT NULL,
  `TglKembali` date NOT NULL,
  `Denda` int(11) NOT NULL,
  `Petugas_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `ID` int(11) NOT NULL,
  `NamaPenerbit` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `NoTelp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`ID`, `NamaPenerbit`, `Alamat`, `NoTelp`) VALUES
(12, 'Aliip Ganteng', 'Jalan Danau Ranau VIII G7A No 13, Kedungkandang, Sawojajar, Kota Malang', '082111016617');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `ID` int(11) NOT NULL,
  `NamaPetugas` varchar(255) NOT NULL,
  `Email` text NOT NULL,
  `Password` int(255) NOT NULL,
  `Role` enum('admin','staf') NOT NULL,
  `Alamat` text NOT NULL,
  `NoTelp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`ID`, `NamaPetugas`, `Email`, `Password`, `Role`, `Alamat`, `NoTelp`) VALUES
(4, 'Alip', 'aleevtugung@gmail.com', 1234, 'admin', 'aabb', 'aaaaa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD KEY `Ketegori_ID` (`Kategori_ID`),
  ADD KEY `Penerbit_ID` (`Penerbit_ID`);

--
-- Indexes for table `detailpeminjaman`
--
ALTER TABLE `detailpeminjaman`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Peminjaman_ID` (`Peminjaman_ID`),
  ADD KEY `Buku_ID` (`Buku_ID`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Anggota_ID` (`Anggota_ID`),
  ADD KEY `Petugas_ID` (`Petugas_ID`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `detailpeminjaman`
--
ALTER TABLE `detailpeminjaman`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`Kategori_ID`) REFERENCES `kategori` (`ID`),
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`Penerbit_ID`) REFERENCES `penerbit` (`ID`);

--
-- Constraints for table `detailpeminjaman`
--
ALTER TABLE `detailpeminjaman`
  ADD CONSTRAINT `detailpeminjaman_ibfk_1` FOREIGN KEY (`Buku_ID`) REFERENCES `buku` (`ID`),
  ADD CONSTRAINT `detailpeminjaman_ibfk_2` FOREIGN KEY (`Peminjaman_ID`) REFERENCES `peminjaman` (`ID`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`Anggota_ID`) REFERENCES `anggota` (`ID`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`Petugas_ID`) REFERENCES `petugas` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
