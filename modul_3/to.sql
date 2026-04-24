-- =============================================================
-- 1. ENTITY: PRODUCT (Supertype)
-- Memenuhi syarat RECURSIVE RELATIONSHIP (Contoh: Produk rekomendasi)
-- =============================================================
CREATE TABLE Product (
    id_product VARCHAR(50) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(12,2) NOT NULL,
    stock INTEGER NOT NULL,
    id_recommended_product VARCHAR(50), -- RECURSIVE: Menunjuk ke produk lain
    CONSTRAINT Product_PK PRIMARY KEY (id_product),
    CONSTRAINT Product_Recursive_FK FOREIGN KEY (id_recommended_product) 
        REFERENCES Product(id_product)
);

-- =============================================================
-- 2. SUBTYPES (Spesialisasi Produk)
-- Memenuhi syarat SUPERTYPE & SUBTYPE
-- =============================================================

-- Subtype A: Electronics
CREATE TABLE Electronics (
    id_product VARCHAR(50) NOT NULL,
    warranty_period INTEGER, -- dalam bulan
    brand VARCHAR(50),
    CONSTRAINT Electronics_PK PRIMARY KEY (id_product),
    CONSTRAINT Electronics_FK FOREIGN KEY (id_product) REFERENCES Product(id_product)
);

-- Subtype B: Fashion
CREATE TABLE Fashion (
    id_product VARCHAR(50) NOT NULL,
    size VARCHAR(10) NOT NULL,
    material VARCHAR(50),
    CONSTRAINT Fashion_PK PRIMARY KEY (id_product),
    CONSTRAINT Fashion_FK FOREIGN KEY (id_product) REFERENCES Product(id_product)
);

-- =============================================================
-- 3. ENTITY: CATEGORY (Tabel Master untuk 3NF)
-- =============================================================
CREATE TABLE Category (
    id_category VARCHAR(10) NOT NULL,
    category_name VARCHAR(50) NOT NULL,
    tax_rate NUMERIC(4,2),
    CONSTRAINT Category_PK PRIMARY KEY (id_category)
);

-- =============================================================
-- 4. ENTITY: ORDER_ITEM (Identifying Relationship)
-- Memenuhi syarat BARRED RELATIONSHIP (id_product nempel ke PK)
-- =============================================================
CREATE TABLE Order_Item (
    id_order VARCHAR(50) NOT NULL,
    id_product VARCHAR(50) NOT NULL, -- Barred: Bagian dari identitas unik
    quantity INTEGER NOT NULL,
    subtotal NUMERIC(12,2) NOT NULL,
    CONSTRAINT OrderItem_PK PRIMARY KEY (id_order, id_product),
    CONSTRAINT OrderItem_Product_FK FOREIGN KEY (id_product) REFERENCES Product(id_product)
);

-- =============================================================
-- 5. ENTITY: SHIPMENT
-- Menambahkan detail pengiriman
-- =============================================================
CREATE TABLE Shipment (
    id_shipment VARCHAR(50) NOT NULL,
    id_order VARCHAR(50) NOT NULL,
    shipment_date DATE NOT NULL,
    tracking_number VARCHAR(100),
    status VARCHAR(20) NOT NULL,
    CONSTRAINT Shipment_PK PRIMARY KEY (id_shipment)
);