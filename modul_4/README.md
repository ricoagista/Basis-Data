# Modul 4 — Basic SQL Commands

Perintah SQL dasar: DDL (CREATE, ALTER, DROP) dan DML (INSERT, UPDATE, DELETE, SELECT) beserta constraint.

## 📄 File

| File | Keterangan |
|------|-----------|
| `MODULE 4 BASIC SQL COMMANDS.pdf` | Materi modul (Bahasa Inggris) |
| `modul-4-ind.pdf` | Materi modul (Bahasa Indonesia) |
| `Schema_Online_Shop.sql` | Skema latihan — toko online (CUSTOMERS, PRODUCTS, ORDERS, ORDER_DETAILS) |

## 🗂️ Skema (`Schema_Online_Shop.sql`)

```sql
CUSTOMERS      -- Data pelanggan
PRODUCTS       -- Data produk (dengan CHECK constraint: Stock >= 0)
ORDERS         -- Transaksi pesanan
ORDER_DETAILS  -- Detail item per pesanan
```

## 📌 Konsep yang Diterapkan

- `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `CHECK`, `DEFAULT`
- `FOREIGN KEY` antar tabel
- Tipe data Oracle: `NUMBER`, `VARCHAR2`, `DATE`
