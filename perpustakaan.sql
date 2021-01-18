-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jan 2021 pada 12.29
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_anggota` varchar(100) NOT NULL,
  `jurusan_anggota` varchar(10) NOT NULL,
  `no_telp_anggota` varchar(13) NOT NULL,
  `alamat_anggota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `username`, `password`, `nama_anggota`, `jurusan_anggota`, `no_telp_anggota`, `alamat_anggota`) VALUES
(1, 'nurul', 'nurul', 'nurul ramadhan', 'TI', '123456789', 'mataram'),
(2, 'nisa', 'nisa', 'nisa ramadhan', 'TI', '087888777567', 'mataram'),
(3, 'nula', 'nula', 'nulasih', 'TI', '089777888999', 'mataram'),
(4, 'iqbal', 'haha', 'agistany', 'TI', '081238028617', 'senggigi'),
(5, 'malik', 'sarung', 'Muhammad Malik', 'ILKOM', '0812939232', 'Gerung'),
(6, 'nanang', 'kosim', 'nangkos', 'Infor', '098727333', 'LOTENG'),
(7, 'hini', 'hantu123', 'inii', 'IT', '08123802891', 'senggigi'),
(8, 'agista', 'agista123', 'Iqbal Agistany', 'TI', '081238028617', 'Jalan Pantai Senggigi GPI'),
(9, 'aisyah', 'qonita123', 'aisyah agistany', 'IPS', '0823321132', 'Purbalingga'),
(10, 'dudu', 'adudu', 'iqball', 'ILKOM', '082331123', 'Senggigi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `penulis_buku` varchar(50) NOT NULL,
  `penerbit_buku` varchar(50) NOT NULL,
  `tahun_terbit` char(4) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `penulis_buku`, `penerbit_buku`, `tahun_terbit`, `stok`) VALUES
(1, 'Memahami Sistem Informasi', 'witarto', 'Informatika Bandung', '2004', 4),
(2, 'sistem operasi', 'Hariyanto Bambang', 'Informatika Bandung', '2007', 3),
(3, 'Basis Data', 'Fathansyah', 'Informatika Bandung', '2007', 6),
(4, 'Etika Komputer', 'Wahyono teguh', 'Andi Offset', '2009', 9),
(5, 'Arsitektur Komputer', 'Hartanto Sri', 'Bsi Press', '2006', 6),
(6, 'Pengenalan Komputer', 'Hartono Jogiyanto', 'Andi Offset', '2005', 5),
(7, 'Teknik Digital', 'Santoso P.Insap', 'Andi Offset', '2008', 8),
(8, 'Jaringan Komputer', 'Sukmajii anjik', 'Andi Offset', '2008', 8),
(9, 'Unix & Linux', 'sidik, Betha', 'Informatik Bandung ', '2004', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `PEMINJAM` AFTER INSERT ON `peminjaman` FOR EACH ROW BEGIN
	UPDATE buku SET stok = stok-1 WHERE id_buku = NEW.id_buku;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `denda` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `pengembalian`
--
DELIMITER $$
CREATE TRIGGER `pengembalian` AFTER INSERT ON `pengembalian` FOR EACH ROW BEGIN
	UPDATE buku SET stok = stok+1 WHERE id_buku = NEW.id_buku;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `jabatan_petugas` varchar(50) NOT NULL,
  `no_telp_petugas` char(13) NOT NULL,
  `alamat_petugas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `jabatan_petugas`, `no_telp_petugas`, `alamat_petugas`) VALUES
(1, 'anis', 'anis', 'anis nuril icta', 'admin', '085338609488', 'rembiga\r\n'),
(2, 'nuril', 'nuril', 'nuril icta', 'admin', '085237473520', 'rembiga'),
(3, 'anas', 'anas', 'khaerul anas', 'admin', '085338223685', 'mataram'),
(4, 'iqbal', 'iqbal', 'muhamad Iqbal agistany', 'admin', '081238028617', 'mataram'),
(5, 'rifqi', 'rifqi', 'rifqi js', 'admin', '085238479419', 'midang'),
(6, 'yas', 'yas', 'muhammad dias janna fitrah', 'admin', '087851377795', 'lotim');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
