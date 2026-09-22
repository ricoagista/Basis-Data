# Tugas Final Project 1 — Sistem Informasi Posyandu

Perancangan basis data untuk sistem informasi posyandu yang mencakup pemantauan kesehatan balita, jadwal imunisasi, dan pemberian vitamin.

## 📄 File

| File | Keterangan |
|------|-----------|
| `tugas.sql` | Skema lengkap basis data sistem posyandu |

## 🗂️ Skema Database (`tugas.sql`)

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

## 📌 Daftar Tabel

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

## 📌 Konsep yang Diterapkan

- Relasi One-to-Many dan Many-to-Many
- `FOREIGN KEY` dengan referential integrity
- `CHECK` constraint (`jenis_kelamin IN ('L','P')`, role)
- `DEFAULT` value (`status_imunisasi`, `tgl_periksa`)
- `CLOB` untuk catatan panjang
- `UNIQUE` pada NIK
