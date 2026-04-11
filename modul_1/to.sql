-- 1. Entitas Pelanggan (Data user yang belanja)
CREATE TABLE tb_customer (
    id_customer VARCHAR(50) NOT NULL,
    nama_lengkap VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    nomor_telepon VARCHAR(20), -- Optional
    CONSTRAINT customer_pk PRIMARY KEY (id_customer)
);

-- 2. Entitas Pesanan (Mencatat transaksi)
CREATE TABLE tb_order (
    id_order VARCHAR(50) NOT NULL,
    id_customer VARCHAR(50) NOT NULL,
    tanggal_pesan DATE NOT NULL,
    status_pengiriman VARCHAR(50), -- Optional
    total_harga NUMERIC(12,2) NOT NULL,
    CONSTRAINT order_pk PRIMARY KEY (id_order),
    CONSTRAINT fk_order_customer FOREIGN KEY (id_customer) REFERENCES tb_customer(id_customer)
);

-- 3. Entitas Kategori (Pengelompokan produk)
CREATE TABLE tb_category (
    id_category VARCHAR(50) NOT NULL,
    nama_kategori VARCHAR(50) NOT NULL,
    deskripsi_singkat VARCHAR(255), -- Optional
    lokasi_rak VARCHAR(20) NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY (id_category)
);

-- 4. Entitas Pembayaran (Detail transaksi keuangan)
CREATE TABLE tb_payment (
    id_payment VARCHAR(50) NOT NULL,
    id_order VARCHAR(50) NOT NULL,
    metode_bayar VARCHAR(50) NOT NULL,
    bukti_transfer VARCHAR(255), -- Optional
    tanggal_konfirmasi DATE NOT NULL,
    CONSTRAINT payment_pk PRIMARY KEY (id_payment),
    CONSTRAINT fk_payment_order FOREIGN KEY (id_order) REFERENCES tb_order(id_order)
);