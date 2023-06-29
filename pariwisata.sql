-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jun 2021 pada 09.29
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pariwisata`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` char(5) NOT NULL,
  `nama_fasilitas` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `nama_fasilitas`) VALUES
('FS001', 'Musholla'),
('FS002', 'Food Court'),
('FS003', 'Toilet'),
('FS004', 'Kamar Mandi'),
('FS005', 'Pintu Keluar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji_golongan_karyawan`
--

CREATE TABLE `gaji_golongan_karyawan` (
  `id_gaji` char(5) NOT NULL,
  `id_gol` varchar(5) DEFAULT NULL,
  `jumlah_gaji` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gaji_golongan_karyawan`
--

INSERT INTO `gaji_golongan_karyawan` (`id_gaji`, `id_gol`, `jumlah_gaji`) VALUES
('GJ000', 'GOL00', 3500000),
('GJ001', 'GOL01', 3000000),
('GJ002', 'GOL02', 3500000),
('GJ003', 'GOL03', 3750000),
('GJ004', 'GOL04', 4000000),
('GJ005', 'GOL05', 2500000),
('GJ006', 'GOL06', 3150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `golongan_karyawan`
--

CREATE TABLE `golongan_karyawan` (
  `id_golongan` char(5) NOT NULL,
  `golongan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `golongan_karyawan`
--

INSERT INTO `golongan_karyawan` (`id_golongan`, `golongan`) VALUES
('GOL00', 'Wahana Operator'),
('GOL01', 'Cleaning Service'),
('GOL02', 'Help Center'),
('GOL03', 'Stand Keeper'),
('GOL04', 'Tour Guide'),
('GOL05', 'Security'),
('GOL06', 'Ticket Keeper');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_buka_tutup`
--

CREATE TABLE `jadwal_buka_tutup` (
  `id_jadwal` char(5) NOT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `jam_buka` varchar(5) DEFAULT NULL,
  `jam_tutup` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal_buka_tutup`
--

INSERT INTO `jadwal_buka_tutup` (`id_jadwal`, `hari`, `jam_buka`, `jam_tutup`) VALUES
('JD001', 'Senin', '08:30', '16:00'),
('JD002', 'Selasa', '07:30', '16:00'),
('JD003', 'Rabu', '07:00', '15:30'),
('JD004', 'Kamis', '07:00', '15:30'),
('JD005', 'Jumat', '08:00', '16:30'),
('JD006', 'Sabtu', '08:00', '17:00'),
('JD007', 'Minggu', '08:00', '17:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_sift_karyawan`
--

CREATE TABLE `jadwal_sift_karyawan` (
  `id_jadwal_sift` char(5) NOT NULL,
  `waktu` varchar(20) DEFAULT NULL,
  `id_sift` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal_sift_karyawan`
--

INSERT INTO `jadwal_sift_karyawan` (`id_jadwal_sift`, `waktu`, `id_sift`) VALUES
('JD001', 'Senin Pagi', 'SK002'),
('JD002', 'Senin Siang', 'SK004'),
('JD003', 'Selasa Pagi', 'SK001'),
('JD004', 'Selasa Siang', 'SK003'),
('JD005', 'Rabu Pagi', 'SK005'),
('JD006', 'Rabu Siang', 'SK006'),
('JD007', 'Kamis Pagi', 'SK007'),
('JD008', 'Kamis Siang', 'SK001'),
('JD009', 'Jumat Pagi', 'SK003'),
('JD010', 'Jumat Siang', 'SK002'),
('JD011', 'Sabtu Pagi', 'SK004'),
('JD012', 'Sabtu Siang', 'SK005'),
('JD013', 'Minggu Pagi', 'SK006'),
('JD014', 'Minggu Siang', 'SK007');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` char(5) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT 'L',
  `no_hp` int(12) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `id_gol` char(5) DEFAULT NULL,
  `id_sift` char(5) DEFAULT NULL,
  `id_gaji` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `jenis_kelamin`, `no_hp`, `alamat`, `tanggal_lahir`, `id_gol`, `id_sift`, `id_gaji`) VALUES
('KR001', 'Sandi Aga', 'L', 2147483647, 'Kebayoran jakarta', '1988-01-17', 'GOL01', 'Sk003', 'GJ001'),
('KR002', 'Joko Susilo', 'L', 2147483647, 'Menteng jakarta', '1994-03-13', 'GOL06', 'Sk002', 'GJ006'),
('KR003', 'Putri Siswanti', 'P', 2147483647, 'Tambun jakarta', '1999-02-08', 'GOL02', 'Sk001', 'GJ002'),
('KR004', 'Andre Baswedan', 'L', 2147483647, 'Cikampek jawa barat', '1992-05-07', 'GOL04', 'Sk006', 'GJ004'),
('KR005', 'Johan Setiawan', 'L', 2147483647, 'Surabaya jawa Timur', '1999-02-08', 'GOL03', 'Sk005', 'GJ003'),
('KR006', 'Sri Mulyana', 'P', 2147483647, 'Tuban jawa Timur', '1978-05-27', 'GOL00', 'Sk005', 'GJ000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id_pengunjung` char(7) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `usia` varchar(3) DEFAULT NULL,
  `jenis_kelamin` enum('P','L') DEFAULT 'L',
  `id_tiket` char(7) DEFAULT NULL,
  `no_hp` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengunjung`
--

INSERT INTO `pengunjung` (`id_pengunjung`, `nama`, `usia`, `jenis_kelamin`, `id_tiket`, `no_hp`) VALUES
('PEN0001', 'Doni Setiawan', '30', 'L', 'TKT0003', 2147483647),
('PEN0002', 'Agus Budiman', '23', 'L', 'TKT0001', 2147483647),
('PEN0003', 'Siti Hajar', '25', 'P', 'TKT0001', 2147483647),
('PEN0004', 'Julaeha', '29', 'P', 'TKT0003', 2147483647),
('PEN0005', 'Dodik Kurniawan', '13', 'L', 'TKT0002', 2147483647),
('PEN0006', 'Angelina', '11', 'P', 'TKT0002', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sift_karyawan`
--

CREATE TABLE `sift_karyawan` (
  `id_sift_karyawan` char(5) NOT NULL,
  `sift_karyawan` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sift_karyawan`
--

INSERT INTO `sift_karyawan` (`id_sift_karyawan`, `sift_karyawan`) VALUES
('SK001', 'A'),
('SK002', 'B'),
('SK003', 'C'),
('SK004', 'D'),
('SK005', 'E'),
('SK006', 'F'),
('SK007', 'G');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` char(7) NOT NULL,
  `jenis_tiket` varchar(15) DEFAULT NULL,
  `harga` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `jenis_tiket`, `harga`) VALUES
('TKT0001', 'Dewasa', 60000),
('TKT0002', 'Anak-Anak', 30000),
('TKT0003', 'Pasangan', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wahana`
--

CREATE TABLE `wahana` (
  `id_wahana` char(3) NOT NULL,
  `nama_wahana` varchar(20) DEFAULT NULL,
  `syarat_usia` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `wahana`
--

INSERT INTO `wahana` (`id_wahana`, `nama_wahana`, `syarat_usia`) VALUES
('W01', 'Roller Coaster', '>17'),
('W02', 'Jet Coaster', '>22'),
('W03', 'Rumah Hantu', '>15'),
('W04', 'Rumah Cermin', NULL),
('W05', 'Mandi Bola', '3-6'),
('W06', 'BomBom Car', '>15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wahana_fasilitas`
--

CREATE TABLE `wahana_fasilitas` (
  `id_wahana_fasilitas` varchar(2) NOT NULL,
  `id_wahana` char(3) DEFAULT NULL,
  `id_fasilitas` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `wahana_fasilitas`
--

INSERT INTO `wahana_fasilitas` (`id_wahana_fasilitas`, `id_wahana`, `id_fasilitas`) VALUES
('1', 'W01', 'FS001'),
('2', 'W01', 'FS003'),
('3', 'W01', 'FS004'),
('4', 'W02', 'FS003'),
('5', 'W02', 'FS002'),
('6', 'W03', 'FS005'),
('7', 'W03', 'FS003'),
('8', 'W04', 'FS003'),
('9', 'W05', 'FS004');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indeks untuk tabel `gaji_golongan_karyawan`
--
ALTER TABLE `gaji_golongan_karyawan`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `id_gol` (`id_gol`);

--
-- Indeks untuk tabel `golongan_karyawan`
--
ALTER TABLE `golongan_karyawan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indeks untuk tabel `jadwal_buka_tutup`
--
ALTER TABLE `jadwal_buka_tutup`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indeks untuk tabel `jadwal_sift_karyawan`
--
ALTER TABLE `jadwal_sift_karyawan`
  ADD PRIMARY KEY (`id_jadwal_sift`),
  ADD KEY `id_sift` (`id_sift`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_gol` (`id_gol`),
  ADD KEY `id_sift` (`id_sift`);

--
-- Indeks untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id_pengunjung`),
  ADD KEY `id_tiket` (`id_tiket`);

--
-- Indeks untuk tabel `sift_karyawan`
--
ALTER TABLE `sift_karyawan`
  ADD PRIMARY KEY (`id_sift_karyawan`);

--
-- Indeks untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`);

--
-- Indeks untuk tabel `wahana`
--
ALTER TABLE `wahana`
  ADD PRIMARY KEY (`id_wahana`);

--
-- Indeks untuk tabel `wahana_fasilitas`
--
ALTER TABLE `wahana_fasilitas`
  ADD PRIMARY KEY (`id_wahana_fasilitas`),
  ADD KEY `id_wahana` (`id_wahana`),
  ADD KEY `id_fasilitas` (`id_fasilitas`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gaji_golongan_karyawan`
--
ALTER TABLE `gaji_golongan_karyawan`
  ADD CONSTRAINT `gaji_golongan_karyawan_ibfk_1` FOREIGN KEY (`id_gol`) REFERENCES `golongan_karyawan` (`id_golongan`);

--
-- Ketidakleluasaan untuk tabel `jadwal_sift_karyawan`
--
ALTER TABLE `jadwal_sift_karyawan`
  ADD CONSTRAINT `jadwal_sift_karyawan_ibfk_1` FOREIGN KEY (`id_sift`) REFERENCES `sift_karyawan` (`id_sift_karyawan`);

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_gol`) REFERENCES `golongan_karyawan` (`id_golongan`),
  ADD CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`id_sift`) REFERENCES `sift_karyawan` (`id_sift_karyawan`);

--
-- Ketidakleluasaan untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD CONSTRAINT `pengunjung_ibfk_1` FOREIGN KEY (`id_tiket`) REFERENCES `tiket` (`id_tiket`);

--
-- Ketidakleluasaan untuk tabel `wahana_fasilitas`
--
ALTER TABLE `wahana_fasilitas`
  ADD CONSTRAINT `wahana_fasilitas_ibfk_1` FOREIGN KEY (`id_wahana`) REFERENCES `wahana` (`id_wahana`),
  ADD CONSTRAINT `wahana_fasilitas_ibfk_2` FOREIGN KEY (`id_fasilitas`) REFERENCES `fasilitas` (`id_fasilitas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
