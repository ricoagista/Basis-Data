# Modul 3 — Relational & Data Normalization

Normalisasi data (1NF–3NF), Supertype & Subtype, Recursive Relationship, dan Barred (Identifying) Relationship.

## 📄 File

| File | Keterangan |
|------|-----------|
| `MODULE 3 RELATIONAL AND DATA NORMALIZATION.pdf` | Materi modul |
| `Assement.sql` | Assessment — skema sepatu dengan supertype/subtype, recursive, dan barred relationship |
| `to.sql` | Try-Out — skema toko online dengan normalisasi penuh |

## 🗂️ Skema Assessment (`Assement.sql`)

Studi kasus: **Koleksi Sepatu — Normalisasi Penuh**

```
Sepatu (Supertype, Recursive)
├── Sepatu_Olahraga  (Subtype A)
├── Sepatu_Formal    (Subtype B)
├── Perawatan        (Barred/Identifying — PK gabungan)
│   └── Kategori_Perawatan  (3NF: hilangkan transitive dependency)
└── Riwayat_Pemakaian
```

## 🗂️ Skema Try-Out (`to.sql`)

Studi kasus: **Toko Online — Normalisasi Penuh**

```
Product (Supertype, Recursive)
├── Electronics  (Subtype A)
├── Fashion      (Subtype B)
├── Order_Item   (Barred — PK: id_order + id_product)
└── Category     (3NF)
```

## 📌 Konsep yang Diterapkan

| Konsep | Implementasi |
|--------|-------------|
| **Supertype/Subtype** | `Sepatu` → `Sepatu_Olahraga`, `Sepatu_Formal` |
| **Recursive Relationship** | `Sepatu.id_parent_sepatu` → `Sepatu.id_sepatu` |
| **Barred (Identifying)** | `Perawatan` PK = `(id_perawatan, id_sepatu)` |
| **3NF** | `Kategori_Perawatan` dipisah untuk hilangkan transitive dependency |
