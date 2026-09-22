# 📝 Tugas Final Project — Sistem Informasi Posyandu

Tugas Final Project (FP) merupakan rangkaian tugas yang saling menyambung dari FP 1 hingga FP 5. Studi kasus yang digunakan adalah **Sistem Informasi Posyandu** untuk pemantauan kesehatan balita, imunisasi, dan pemberian vitamin.

---

## 📄 Daftar File

| File | Keterangan |
|------|-----------|
| [`puskesmas.sql`](./puskesmas.sql) | Skema database lengkap (DDL) — dibuat di FP 1 |
| [`Tugas FP1.pdf`](./Tugas%20FP1.pdf) | Final Project 1 |
| [`Tugas FP2.pdf`](./Tugas%20FP2.pdf) | Final Project 2 |
| [`Tugas FP3.pdf`](./Tugas%20FP3.pdf) | Final Project 3 |
| [`Tugas FP4.pdf`](./Tugas%20FP4.pdf) | Final Project 4 |
| [`Tugas FP5.pdf`](./Tugas%20FP5.pdf) | Final Project 5 |

---

## 🗂️ Skema Database (`puskesmas.sql`)

```
puskesmas
├── petugas
│   └── pemeriksaan ──── balita
│                            ├── orang_tua
│                            ├── jadwal_imunisasi ── vaksin
│                            ├── pemberian_vitamin ── vitamin
│                            └── status_gizi (via pemeriksaan)
└── pengguna (login: Admin / Petugas / Orang Tua)
```

### Daftar Tabel

| No | Tabel | Keterangan |
|----|-------|-----------|
| 1 | `puskesmas` | Data puskesmas/posyandu |
| 2 | `petugas` | Tenaga medis dan petugasnya |
| 3 | `orang_tua` | Data orang tua balita |
| 4 | `balita` | Data balita yang dipantau |
| 5 | `vaksin` | Master data vaksin |
| 6 | `jadwal_imunisasi` | Jadwal imunisasi per balita |
| 7 | `pemeriksaan` | Rekam pemeriksaan rutin (BB, TB, lingkar kepala) |
| 8 | `vitamin` | Master data vitamin |
| 9 | `pemberian_vitamin` | Riwayat pemberian vitamin |
| 10 | `status_gizi` | Status gizi & kategori stunting |
| 11 | `pengguna` | Akun login sistem (Admin, Petugas, Orang Tua) |

---

## 📌 Konsep yang Diterapkan

- Relasi One-to-Many dan Many-to-Many
- `FOREIGN KEY` dengan referential integrity
- `CHECK` constraint (`jenis_kelamin IN ('L','P')`, role)
- `DEFAULT` value (`status_imunisasi`, `tgl_periksa`)
- `CLOB` untuk catatan panjang
- `UNIQUE` pada NIK
