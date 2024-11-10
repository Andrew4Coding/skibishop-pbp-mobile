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

# Tugas 8 - PBP 2024/2025
## 1. Jelaskan Kegunaan `const` di Flutter, Keuntungan Menggunakan `const`, Kapan Menggunakan `const`, dan Kapan Tidak Menggunakan `const`

`const` di Flutter digunakan untuk mendeklarasikan objek yang nilainya tidak berubah selama aplikasi berjalan. Ketika sebuah widget diberi label `const`, Flutter mengoptimalkan penggunaan memori dan performa, karena objek tersebut akan dibuat hanya sekali dan digunakan kembali.

Keuntungan memakai `const` yaitu:
- **Efisiensi Memori**: Objek yang diberi `const` hanya akan diciptakan sekali dan dapat digunakan berulang kali tanpa alokasi memori ulang.
- **Peningkatan Performa**: Menghindari pembuatan ulang widget yang sama, sehingga mempercepat proses rendering dan meningkatkan performa.
- **Konsistensi**: Memastikan nilai tetap konsisten selama aplikasi berjalan.

Gunakan `const` pada widget yang tidak akan mengalami perubahan, misalnya Text static, gambar static, atau layout yang tidak berubah. Namun hindari penggunaan `const` pada widget yang mengandung data yang dapat berubah, seperti input pengguna, hasil API, atau Widget yang mengandung state.

---

## 2. Perbandingan Penggunaan `Column` dan `Row` di Flutter
### `Column`
- **Fungsi**: Menyusun widget secara vertikal (atas ke bawah).
- **Kegunaan**: Digunakan untuk menata widget yang harus ditampilkan dalam urutan vertikal
- **Contoh Implementasi**:
  ```dart
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        item.count.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Icon(
        item.icon,
        color: Colors.white,
        size: 30.0,
      ),
      const SizedBox(height: 8.0),
      Text(
        item.name,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    ],
    ),
  ```

### `Row`
- **Fungsi**: Menyusun widget secara horizontal (kiri ke kanan).
- **Kegunaan**: Digunakan untuk menata widget yang harus ditampilkan dalam urutan horizontal, seperti ikon atau tombol yang diletakkan berdampingan.
- **Contoh Implementasi**:
  ```dart
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Icon(Icons.home),
      Icon(Icons.search),
      Icon(Icons.settings),
    ],
  );
  ```

### Perbandingan
- `Column` digunakan untuk tata letak vertikal, sementara `Row` digunakan untuk tata letak horizontal.
- Kedua widget ini bisa digabungkan untuk membuat tata letak yang lebih kompleks.

---

## 3. Elemen Input pada Form Flutter

Pada tugas kali ini, elemen input yang digunakan antara lain:
- **`TextField`**: Untuk memasukkan teks seperti nama, email, atau pesan.
- **`Checkbox`**: Untuk memilih opsi atau konfirmasi persetujuan.
- **`Radio`**: Untuk memilih salah satu dari beberapa opsi.

### Elemen Input Lain yang Tidak Digunakan
- **`Switch`**: Digunakan untuk pilihan biner seperti aktif/nonaktif.
- **`DropdownButton`**: Digunakan untuk memilih dari daftar pilihan, yang mungkin tidak diperlukan dalam form ini.

---

## 4. Mengatur Tema dalam Aplikasi Flutter

Untuk menjaga konsistensi aplikasi, tema aplikasi dapat diatur dengan menggunakan `ThemeData` pada widget `MaterialApp`. Dengan ini, kita bisa menentukan tema global untuk aplikasi, seperti warna utama, font, dan elemen lainnya.

### Contoh Implementasi Tema:
```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black),
    ),
  ),
  home: HomePage(),
);
```

Ini memastikan bahwa seluruh aplikasi menggunakan tema yang konsisten, dan setiap elemen yang membutuhkan tema akan mengikuti pengaturan ini.

---

## 5. Menangani Navigasi dalam Aplikasi dengan Banyak Halaman

Navigasi di Flutter dapat dilakukan menggunakan `Navigator`. Untuk berpindah antar halaman, kita bisa menggunakan `Navigator.push()`, dan untuk kembali ke halaman sebelumnya, kita menggunakan `Navigator.pop()`.

### Menggunakan `Navigator.push` untuk Pindah ke Halaman Baru:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
);
```

### Menggunakan `Navigator.pop` untuk Kembali ke Halaman Sebelumnya:
```dart
Navigator.pop(context);
```

Dengan `Navigator`, kita dapat dengan mudah mengelola navigasi antar halaman di aplikasi, baik untuk aplikasi dengan dua halaman atau aplikasi besar dengan banyak layar.

---
