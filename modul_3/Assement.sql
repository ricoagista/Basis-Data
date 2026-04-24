-- =============================================================
-- 1. SUPERTYPE: SEPATU
-- Memasukkan unsur RECURSIVE (id_parent_sepatu)
-- =============================================================
CREATE TABLE Sepatu (
    id_sepatu VARCHAR(50) NOT NULL,
    merek_sepatu VARCHAR(100) NOT NULL,
    ukuran INTEGER NOT NULL,
    berat_kg NUMERIC(4,2),
    id_parent_sepatu VARCHAR(50), -- Relasi ke diri sendiri (Recursive)
    CONSTRAINT Sepatu_PK PRIMARY KEY (id_sepatu),
    CONSTRAINT Sepatu_Recursive_FK FOREIGN KEY (id_parent_sepatu) 
        REFERENCES Sepatu(id_sepatu)
);

-- =============================================================
-- 2. SUBTYPES: SPESIALISASI SEPATU
-- Memenuhi instruksi Supertype dan Subtype
-- =============================================================

-- Subtype A: Sepatu Olahraga
CREATE TABLE Sepatu_Olahraga (
    id_sepatu VARCHAR(50) NOT NULL,
    jenis_olahraga VARCHAR(50) NOT NULL,
    tipe_bantalan VARCHAR(50),
    CONSTRAINT Sepatu_Olahraga_PK PRIMARY KEY (id_sepatu),
    CONSTRAINT Sepatu_Olahraga_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);

-- Subtype B: Sepatu Formal
CREATE TABLE Sepatu_Formal (
    id_sepatu VARCHAR(50) NOT NULL,
    jenis_bahan VARCHAR(50) NOT NULL,
    warna_formal VARCHAR(30),
    CONSTRAINT Sepatu_Formal_PK PRIMARY KEY (id_sepatu),
    CONSTRAINT Sepatu_Formal_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);

-- =============================================================
-- 3. MASTER DATA: KATEGORI PERAWATAN
-- Memenuhi syarat 3NF (Menghilangkan Transitive Dependency)
-- =============================================================
CREATE TABLE Kategori_Perawatan (
    id_kategori VARCHAR(10) NOT NULL,
    nama_kategori VARCHAR(50) NOT NULL,
    biaya_standar NUMERIC(10,2) NOT NULL,
    CONSTRAINT Kategori_PK PRIMARY KEY (id_kategori)
);

-- =============================================================
-- 4. TRANSAKSI: PERAWATAN
-- Memenuhi syarat BARRED (IDENTIFYING) RELATIONSHIP
-- =============================================================
CREATE TABLE Perawatan (
    id_perawatan VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL, -- PK gabungan (Barred)
    id_kategori VARCHAR(10) NOT NULL,
    tanggal_rawat DATE NOT NULL,
    status_selesai CHAR(1) NOT NULL,
    CONSTRAINT Perawatan_PK PRIMARY KEY (id_perawatan, id_sepatu),
    CONSTRAINT Perawatan_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu),
    CONSTRAINT Perawatan_Kat_FK FOREIGN KEY (id_kategori) REFERENCES Kategori_Perawatan(id_kategori)
);

-- =============================================================
-- 5. RIWAYAT PEMAKAIAN
-- =============================================================
CREATE TABLE Riwayat_Pemakaian (
    id_pemakaian VARCHAR(50) NOT NULL,
    id_sepatu VARCHAR(50) NOT NULL,
    tanggal_pakai DATE NOT NULL,
    lokasi_pemakaian VARCHAR(100) NOT NULL,
    jarak_tempuh_km NUMERIC(5,2),
    CONSTRAINT Riwayat_PK PRIMARY KEY (id_pemakaian),
    CONSTRAINT Riwayat_Sepatu_FK FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);