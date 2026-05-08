-- 1. Tabel Pelanggan (CUSTOMERS)
CREATE TABLE CUSTOMERS (
    CustomerID NUMBER(5) PRIMARY KEY, 
    CustomerName VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    JoinDate DATE DEFAULT SYSDATE
);

-- 2. Tabel Produk (PRODUCTS)
CREATE TABLE PRODUCTS (
    ProductID VARCHAR2(10) PRIMARY KEY, 
    ProductName VARCHAR2(150) NOT NULL,
    Price NUMBER(10, 2) NOT NULL,
    Stock NUMBER(5) CHECK (Stock >= 0) 
);

-- 3. Tabel Pesanan (ORDERS)
CREATE TABLE ORDERS (
    OrderID NUMBER(10) PRIMARY KEY,
    CustomerID NUMBER(5), 
    OrderDate DATE DEFAULT SYSDATE,
    TotalAmount NUMBER(10, 2)
);

-- 4. Tabel Detail Pesanan (ORDER_DETAILS)
CREATE TABLE ORDER_DETAILS (
    OrderDetailID NUMBER(10) PRIMARY KEY,
    OrderID NUMBER(10), 
    ProductID VARCHAR2(10),
    Quantity NUMBER(5) NOT NULL,
    Subtotal NUMBER(10, 2)
);