-- 1. Entity: Sepatu (Prime Entity)
-- Menambah atribut: tipe_sepatu (*) dan berat_sepatu (o)
CREATE TABLE Sepatu (
    id_sepatu VARCHAR(50) NOT NULL,
    merek_sepatu VARCHAR(100) NOT NULL,
    ukuran INTEGER NOT NULL,
    tipe_sepatu VARCHAR(50) NOT NULL, -- New Attribute (Mandatory)
    berat_kg NUMERIC(4,2),           -- New Attribute (Numeric Precision & Scale)
    tanggal_beli DATE,
    CONSTRAINT Sepatu_PK PRIMARY KEY (id_sepatu)
);

-- 2. Entity: Kategori_Perawatan (New Entity for Relationship)
-- Ditambahkan untuk memenuhi syarat relasi tambahan dan normalisasi
CREATE TABLE Kategori_Perawatan (
    id_kategori VARCHAR(10) NOT NULL,
    nama_kategori VARCHAR(50) NOT NULL,
    deskripsi VARCHAR(255),
    CONSTRAINT Kategori_PK PRIMARY KEY (id_kategori)
);

-- 3. Entity: Perawatan (Characteristic Entity)
-- Menambah atribut: status_selesai (*) dan estimasi_jam (o)
-- Relasi: Many-to-One ke Sepatu & Many-to-One ke Kategori_Perawatan
CREATE TABLE Perawatan (
    id_perawatan VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL,
    id_kategori VARCHAR(10) NOT NULL, -- New Relationship (Many-to-Many via this table or 1-M)
    jenis_cuci VARCHAR(100) NOT NULL,
    tanggal_rawat DATE NOT NULL,
    biaya_rawat NUMERIC(10,2) NOT NULL, -- Numeric Attribute with Precision & Scale
    status_selesai CHAR(1) NOT NULL,    -- New Attribute (Mandatory)
    estimasi_jam INTEGER,               -- New Attribute (Optional)
    CONSTRAINT Perawatan_PK PRIMARY KEY (id_perawatan),
    CONSTRAINT Perawatan_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu),
    CONSTRAINT Perawatan_Kat_FK FOREIGN KEY (id_kategori) REFERENCES Kategori_Perawatan(id_kategori)
);

-- 4. Entity: Riwayat_Pemakaian
-- Menambah atribut: lokasi_pemakaian (*) dan jarak_tempuh_km (o)
CREATE TABLE Riwayat_Pemakaian (
    id_pemakaian VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL,
    tanggal_pakai DATE NOT NULL,
    lokasi_pemakaian VARCHAR(100) NOT NULL, -- New Attribute (Mandatory)
    jarak_tempuh_km NUMERIC(5,2),           -- New Attribute (Numeric Precision & Scale)
    kondisi_cuaca VARCHAR(50),
    durasi_jam INTEGER NOT NULL,
    CONSTRAINT Riwayat_PK PRIMARY KEY (id_pemakaian),
    CONSTRAINT Riwayat_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);

-- 5. Entity: Foto_Koleksi
CREATE TABLE Foto_Koleksi (
    id_foto VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL,
    nama_file VARCHAR(255) NOT NULL,
    tanggal_ambil DATE NOT NULL,
    keterangan_foto VARCHAR(255),
    CONSTRAINT Foto_PK PRIMARY KEY (id_foto),
    CONSTRAINT Foto_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);

-- 6. Entity: Aksesoris_Tambahan
CREATE TABLE Aksesoris_Tambahan (
    id_aksesoris VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL,
    nama_barang VARCHAR(100) NOT NULL,
    warna VARCHAR(50),
    jumlah INTEGER NOT NULL,
    CONSTRAINT Aksesoris_PK PRIMARY KEY (id_aksesoris),
    CONSTRAINT Aksesoris_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);