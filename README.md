E-Commerce Mobile Application for True Sigma

### 🧑‍🦰 Author
- Name: Andrew Devito Aryo
- NPM: 2306152494
- Kelas: PBP F

### ⚙️ Tech Stack
- **Backend**: Django
- **Styling**: Material App & Cupertino
- **Font**: DM Sans, Catemaran

## 📚 Archive Tugas 
- [Tugas 7 PBP 2024/2025](https://github.com/Andrew4Coding/skibishop-pbp-mobile/wiki/Tugas-7-PBP-2024-2025)
- [Tugas 8 PBP 2024/2025](https://github.com/Andrew4Coding/skibishop-pbp-mobile/wiki/Tugas-8-PBP-2024-2025)

---
# Tugas 9 - PBP 2024/2025
## 1. Mengapa Perlu Membuat Model untuk Pengambilan atau Pengiriman Data JSON?
Model diperlukan untuk:
- **Strukturisasi Data:** Membantu memetakan data JSON menjadi objek Dart yang terstruktur, sehingga lebih mudah diakses dan digunakan.
- **Validasi dan Transformasi:** Memastikan bahwa data yang diterima memiliki format dan tipe yang sesuai.
- **Pemeliharaan Kode:** Kode menjadi lebih terorganisir karena setiap data memiliki representasi khusus.

**Apakah akan terjadi error jika tidak membuat model?**
Tidak membuat model tidak selalu menyebabkan error, tetapi:
- Data JSON harus diproses secara manual, sehingga rentan terhadap kesalahan.
- Akses ke data menjadi lebih rumit dan rawan kesalahan tipe data.
- Aplikasi menjadi sulit untuk dikembangkan dan dipelihara.

---

## 2. Fungsi Library `http`
Library `http` digunakan untuk:
- **Melakukan HTTP Request:** Mengirim request (GET, POST, PUT, DELETE) ke server.
- **Mengambil Data dari API:** Mendapatkan respons dalam bentuk JSON atau format lain.
- **Mengirimkan Data ke Server:** Mengirim data dalam format tertentu seperti JSON ke API server.

Pada tugas ini, library `http` digunakan untuk mengambil data dari server Django yang berisi informasi produk dalam bentuk JSON.

---

## 3. Fungsi CookieRequest
`CookieRequest` adalah bagian dari package `pbp_django_auth` yang berfungsi untuk:
- **Mengelola Otentikasi:** Menyimpan sesi login pengguna melalui cookie.
- **Menyederhanakan HTTP Request:** Mempermudah proses pengiriman data dengan autentikasi tanpa harus menambahkan header secara manual.
- **Mendukung Stateful Request:** Mengingat status login pengguna di berbagai request.

### Mengapa Instance CookieRequest Dibagikan ke Semua Komponen?
- **Konsistensi Status Login:** Semua komponen membutuhkan informasi status login yang sama.
- **Menghindari Redundansi:** Instance yang sama memungkinkan pengelolaan session tanpa membuat koneksi baru setiap kali request dilakukan.
- **Integrasi Data Global:** Mempermudah akses data global seperti token autentikasi dan session pengguna.

---

## 4. Mekanisme Pengiriman Data dari Input hingga Ditampilkan di Flutter
1. **Input Data:**
   Pengguna memasukkan data melalui antarmuka Flutter (misalnya form atau button).

2. **Mengirim Request:**
   Data yang dimasukkan dikirim ke server menggunakan `http` atau `CookieRequest` dalam format tertentu (misalnya JSON).

3. **Proses di Backend:**
   - Server Django menerima data request.
   - Backend memproses data (misalnya menyimpan ke database atau melakukan perhitungan).
   - Django mengembalikan respons dalam bentuk JSON.

4. **Menerima Respons:**
   Aplikasi Flutter menerima respons dari server.

5. **Dekoding Data:**
   Respons JSON dikonversi menjadi objek Dart (menggunakan model).

6. **Menampilkan Data:**
   Data yang sudah dikonversi ditampilkan dalam antarmuka Flutter.

---

## 5. Mekanisme Autentikasi Login, Register, dan Logout
### **Proses Login**
1. **Input Data:**
   Pengguna memasukkan email dan password di Flutter.
2. **Mengirim Request:**
   Data dikirim ke endpoint login Django menggunakan `CookieRequest`.
3. **Proses Backend:**
   - Django memverifikasi kredensial pengguna.
   - Jika berhasil, server mengembalikan cookie autentikasi.
4. **Menyimpan Status:**
   Cookie disimpan di `CookieRequest` untuk digunakan pada request berikutnya.
5. **Tampilan Menu:**
   Setelah login berhasil, menu utama aplikasi ditampilkan sesuai dengan status login.

### **Proses Register**
1. **Input Data:**
   Pengguna memasukkan informasi akun (misalnya nama, email, password).
2. **Mengirim Request:**
   Data dikirim ke endpoint register Django menggunakan `http` atau `CookieRequest`.
3. **Proses Backend:**
   - Django menyimpan data pengguna baru ke database.
   - Django mengembalikan respons keberhasilan.
4. **Notifikasi:**
   Flutter menampilkan pesan sukses atau error berdasarkan respons.

### **Proses Logout**
1. **Request Logout:**
   Flutter mengirimkan request ke endpoint logout Django menggunakan `CookieRequest`.
2. **Hapus Cookie:**
   Django menghapus session pengguna.
3. **Update Status:**
   Aplikasi Flutter memperbarui status pengguna menjadi tidak login.
4. **Navigasi:**
   Pengguna diarahkan kembali ke halaman login.
