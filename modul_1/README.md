# Modul 1 — Basic Concept of Database

Pengenalan konsep dasar basis data: entitas, atribut, primary key, foreign key, dan relasi antar tabel.

## 📄 File

| File | Keterangan |
|------|-----------|
| `MODULE 1 BASIC CONCEPT OF DATABASE.pdf` | Materi modul |
| `assement.sql` | Assessment — skema manajemen koleksi sepatu (Prime Entity + 4 Characteristic Entity) |
| `to.sql` | Try-Out — skema toko online sederhana (Customer, Order, Category, Payment) |

## 🗂️ Skema Assessment (`assement.sql`)

Studi kasus: **Koleksi Sepatu Pribadi**

```
Sepatu (Prime Entity)
├── Riwayat_Pemakaian
├── Perawatan
├── Foto_Koleksi
└── Aksesoris_Tambahan
```

## 🗂️ Skema Try-Out (`to.sql`)

Studi kasus: **Toko Online**

```
tb_customer ─── tb_order ─── tb_payment
tb_category
```
