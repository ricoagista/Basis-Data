-- 1. Tabel Posyandu/Puskesmas
CREATE TABLE puskesmas (
    id_puskesmas NUMBER PRIMARY KEY,
    nama_puskesmas VARCHAR2(100) NOT NULL,
    alamat VARCHAR2(255),
    kecamatan VARCHAR2(100)
);

-- 2. Tabel Petugas/Tenaga Medis
CREATE TABLE petugas (
    id_petugas NUMBER PRIMARY KEY,
    nama_petugas VARCHAR2(100) NOT NULL,
    jabatan VARCHAR2(50),
    no_telp VARCHAR2(15),
    id_puskesmas NUMBER,
    CONSTRAINT fk_petugas_puskesmas FOREIGN KEY (id_puskesmas) REFERENCES puskesmas(id_puskesmas)
);

-- 3. Tabel Orang Tua
CREATE TABLE orang_tua (
    id_ortu NUMBER PRIMARY KEY,
    nik_ortu VARCHAR2(16) UNIQUE NOT NULL,
    nama_ortu VARCHAR2(100) NOT NULL,
    alamat VARCHAR2(255),
    no_hp VARCHAR2(15)
);

-- 4. Tabel Balita
CREATE TABLE balita (
    id_balita NUMBER PRIMARY KEY,
    nik_balita VARCHAR2(16) UNIQUE NOT NULL,
    nama_balita VARCHAR2(100) NOT NULL,
    tgl_lahir DATE NOT NULL,
    jenis_kelamin CHAR(1) CHECK (jenis_kelamin IN ('L', 'P')),
    id_ortu NUMBER,
    id_puskesmas NUMBER,
    CONSTRAINT fk_balita_ortu FOREIGN KEY (id_ortu) REFERENCES orang_tua(id_ortu),
    CONSTRAINT fk_balita_puskesmas FOREIGN KEY (id_puskesmas) REFERENCES puskesmas(id_puskesmas)
);

-- 5. Tabel Vaksin (Master Data)
CREATE TABLE vaksin (
    id_vaksin NUMBER PRIMARY KEY,
    nama_vaksin VARCHAR2(50) NOT NULL,
    deskripsi VARCHAR2(255)
);

-- 6. Tabel Jadwal Imunisasi
CREATE TABLE jadwal_imunisasi (
    id_jadwal NUMBER PRIMARY KEY,
    id_balita NUMBER,
    id_vaksin NUMBER,
    tgl_rencana DATE,
    status_imunisasi VARCHAR2(20) DEFAULT 'Belum',
    CONSTRAINT fk_jadwal_balita FOREIGN KEY (id_balita) REFERENCES balita(id_balita),
    CONSTRAINT fk_jadwal_vaksin FOREIGN KEY (id_vaksin) REFERENCES vaksin(id_vaksin)
);

-- 7. Tabel Pemeriksaan (Monitoring Rutin)
CREATE TABLE pemeriksaan (
    id_pemeriksaan NUMBER PRIMARY KEY,
    id_balita NUMBER,
    id_petugas NUMBER,
    tgl_periksa DATE DEFAULT SYSDATE,
    berat_badan NUMBER(5,2), -- dalam kg
    tinggi_badan NUMBER(5,2), -- dalam cm
    lingkar_kepala NUMBER(5,2),
    catatan_kesehatan CLOB,
    CONSTRAINT fk_periksa_balita FOREIGN KEY (id_balita) REFERENCES balita(id_balita),
    CONSTRAINT fk_periksa_petugas FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

-- 8. Tabel Vitamin
CREATE TABLE vitamin (
    id_vitamin NUMBER PRIMARY KEY,
    nama_vitamin VARCHAR2(50),
    periode_pemberian VARCHAR2(50) -- Contoh: Februari/Agustus
);

-- 9. Tabel Pemberian Vitamin (Relasi Many-to-Many)
CREATE TABLE pemberian_vitamin (
    id_pemberian NUMBER PRIMARY KEY,
    id_balita NUMBER,
    id_vitamin NUMBER,
    tgl_pemberian DATE,
    CONSTRAINT fk_vit_balita FOREIGN KEY (id_balita) REFERENCES balita(id_balita),
    CONSTRAINT fk_vit_master FOREIGN KEY (id_vitamin) REFERENCES vitamin(id_vitamin)
);

-- 10. Tabel Gizi (Status Gizi)
CREATE TABLE status_gizi (
    id_status NUMBER PRIMARY KEY,
    id_pemeriksaan NUMBER,
    kategori_stunting VARCHAR2(50), -- Stunting, Normal, Gizi Buruk
    saran_gizi CLOB,
    CONSTRAINT fk_gizi_periksa FOREIGN KEY (id_pemeriksaan) REFERENCES pemeriksaan(id_pemeriksaan)
);

-- 11. Tabel Akun Pengguna (Untuk login sistem)
CREATE TABLE pengguna (
    id_user NUMBER PRIMARY KEY,
    username VARCHAR2(50) UNIQUE NOT NULL,
    password VARCHAR2(255) NOT NULL,
    role VARCHAR2(20) CHECK (role IN ('Admin', 'Petugas', 'Orang Tua')),
    id_petugas NUMBER,
    id_ortu NUMBER,
    CONSTRAINT fk_user_petugas FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
    CONSTRAINT fk_user_ortu FOREIGN KEY (id_ortu) REFERENCES orang_tua(id_ortu)
);