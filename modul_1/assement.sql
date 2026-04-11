-- Tabel Prime Entity
CREATE TABLE Sepatu (
    id_sepatu VARCHAR(50) NOT NULL,
    merek_sepatu VARCHAR(100) NOT NULL,
    ukuran INTEGER NOT NULL,
    tanggal_beli DATE,
    CONSTRAINT Sepatu_PK PRIMARY KEY (id_sepatu)
);

-- Tabel Characteristic Entity 1
CREATE TABLE Riwayat_Pemakaian (
    id_pemakaian VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL,
    tanggal_pakai DATE NOT NULL,
    kondisi_cuaca VARCHAR(50),
    durasi_jam INTEGER NOT NULL,
    CONSTRAINT Riwayat_PK PRIMARY KEY (id_pemakaian),
    CONSTRAINT Riwayat_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);

-- Tabel Characteristic Entity 2
CREATE TABLE Perawatan (
    id_perawatan VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL,
    jenis_cuci VARCHAR(100) NOT NULL,
    tanggal_rawat DATE NOT NULL,
    biaya_rawat NUMERIC(10,2),
    CONSTRAINT Perawatan_PK PRIMARY KEY (id_perawatan),
    CONSTRAINT Perawatan_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);

-- Tabel Characteristic Entity 3
CREATE TABLE Foto_Koleksi (
    id_foto VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL,
    nama_file VARCHAR(255) NOT NULL,
    tanggal_ambil DATE NOT NULL,
    keterangan_foto VARCHAR(255),
    CONSTRAINT Foto_PK PRIMARY KEY (id_foto),
    CONSTRAINT Foto_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);

-- Tabel Characteristic Entity 4
CREATE TABLE Aksesoris_Tambahan (
    id_aksesoris VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL,
    nama_barang VARCHAR(100) NOT NULL,
    warna VARCHAR(50),
    jumlah INTEGER NOT NULL,
    CONSTRAINT Aksesoris_PK PRIMARY KEY (id_aksesoris),
    CONSTRAINT Aksesoris_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);