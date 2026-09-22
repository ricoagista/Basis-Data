# Modul 2 — Relational Data Modeling

Pemodelan data relasional: penambahan atribut baru, relasi Many-to-Many, serta numeric precision & scale.

## 📄 File

| File | Keterangan |
|------|-----------|
| `MODULE 2 RELATIONAL DATA MODELING.pdf` | Materi modul |
| `assement/assesment.sql` | Assessment — pengembangan skema sepatu dengan relasi tambahan |
| `to/to.sql` | Try-Out — skema toko online dengan relasi produk, order, dan order item |

## 🗂️ Skema Assessment (`assement/assesment.sql`)

Pengembangan dari Modul 1 dengan penambahan:
- Atribut baru: `tipe_sepatu`, `berat_kg`, `lokasi_pemakaian`, `jarak_tempuh_km`
- Entitas baru: `Kategori_Perawatan` (relasi Many-to-One ke `Perawatan`)

## 🗂️ Skema Try-Out (`to/to.sql`)

Studi kasus: **Toko Online**

```
tb_category ──< tb_product ──< tb_order_item >── tb_order
```
