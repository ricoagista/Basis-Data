-- Create Entities for Online Shop System

-- 1. Entity tb_product (Existing)
CREATE TABLE tb_product (
    id_product   INTEGER NOT NULL,
    nama_product VARCHAR2(100) NOT NULL,
    stok         INTEGER,
    -- Menambahkan numeric attribute dengan precision dan scale (Poin 2)
    -- Precision 12 (total digit), Scale 2 (dua angka di belakang koma)
    harga        NUMBER(12, 2) NOT NULL, 
    id_category  INTEGER NOT NULL
);

ALTER TABLE tb_product ADD CONSTRAINT tb_product_pk PRIMARY KEY ( id_product );

-- 2. Entity tb_category (New Entity)
CREATE TABLE tb_category (
    id_category   INTEGER NOT NULL,
    nama_category VARCHAR2(50) NOT NULL
);

ALTER TABLE tb_category ADD CONSTRAINT tb_category_pk PRIMARY KEY ( id_category );

-- 3. Entity tb_order (New Entity untuk relasi)
CREATE TABLE tb_order (
    id_order     INTEGER NOT NULL,
    tgl_order    DATE NOT NULL,
    total_bayar  NUMBER(15, 2)
);

ALTER TABLE tb_order ADD CONSTRAINT tb_order_pk PRIMARY KEY ( id_order );

-- 4. Entity tb_order_item (Untuk menangani relasi Many-to-Many antara Product & Order)
CREATE TABLE tb_order_item (
    id_order_item INTEGER NOT NULL,
    id_order      INTEGER NOT NULL,
    id_product    INTEGER NOT NULL,
    kuantitas     INTEGER NOT NULL,
    subtotal      NUMBER(12, 2)
);

ALTER TABLE tb_order_item ADD CONSTRAINT tb_order_item_pk PRIMARY KEY ( id_order_item );

-- Define Relationships (Poin 3 & 4)

-- Relationship: tb_category to tb_product (One-to-Many)
-- Satu kategori bisa punya banyak produk, satu produk wajib punya satu kategori.
ALTER TABLE tb_product
    ADD CONSTRAINT category_product_fk FOREIGN KEY ( id_category )
        REFERENCES tb_category ( id_category );

-- Relationship: tb_order to tb_order_item (One-to-Many)
ALTER TABLE tb_order_item
    ADD CONSTRAINT order_item_order_fk FOREIGN KEY ( id_order )
        REFERENCES tb_order ( id_order );

-- Relationship: tb_product to tb_order_item (One-to-Many)
ALTER TABLE tb_order_item
    ADD CONSTRAINT order_item_product_fk FOREIGN KEY ( id_product )
        REFERENCES tb_product ( id_product );