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
## 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

`const` di Flutter digunakan untuk mendeklarasikan objek yang nilainya tidak berubah selama aplikasi berjalan. Ketika sebuah widget diberi label `const`, Flutter mengoptimalkan penggunaan memori dan performa, karena objek tersebut akan dibuat hanya sekali dan digunakan kembali.

Keuntungan memakai `const` yaitu:
- **Efisiensi Memori**: Objek yang diberi `const` hanya akan diciptakan sekali dan dapat digunakan berulang kali tanpa alokasi memori ulang.
- **Peningkatan Performa**: Menghindari pembuatan ulang widget yang sama, sehingga mempercepat proses rendering dan meningkatkan performa.
- **Konsistensi**: Memastikan nilai tetap konsisten selama aplikasi berjalan.

Gunakan `const` pada widget yang tidak akan mengalami perubahan, misalnya Text static, gambar static, atau layout yang tidak berubah. Namun hindari penggunaan `const` pada widget yang mengandung data yang dapat berubah, seperti input pengguna, hasil API, atau Widget yang mengandung state.

---

## 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
### `Column`
- **Fungsi**: Menyusun widget secara vertikal (atas ke bawah).
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
- **Contoh Implementasi**:
  ```dart
      Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: InfoCard(title: 'NPM', content: npm)),
            Expanded(child: InfoCard(title: 'Name', content: name)),
            Expanded(child: InfoCard(title: 'Class', content: className)),
          ],
        ),
      ),
  ```
---

## 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada tugas ini, saya menggunakan salah satu elemen input yaitu `TextField`, ini digunakan untuk menginput beberapa data, misalkan nama produk, toko, dan harga. Ada beberapa elemen input lain yang tidak digunakan dalam tugas ini, misalnya `Checkbox`, `Radio`, `Switch`, `DropdownButton`, dll. Elemen-elemen input ini tidak digunakan karena data yang dinput hanya berupa teks sederhana.

---

## 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Untuk menjaga konsistensi aplikasi, tema aplikasi dapat diatur dengan menggunakan `ThemeData` pada widget `MaterialApp`. Dengan ini, kita bisa menentukan tema global untuk aplikasi, seperti warna utama, font, dan elemen lainnya.

### Contoh Implementasi Tema:
```dart
  ...
  backgroundColor: Theme.of(context).colorScheme.primary,
  ...
```

Ini memastikan bahwa seluruh aplikasi menggunakan tema yang konsisten, dan setiap elemen yang membutuhkan tema akan mengikuti setting ini.

---

## 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Navigasi di Flutter dapat dilakukan menggunakan `Navigator`. Untuk berpindah antar halaman, kita bisa menggunakan `Navigator.push()`, dan untuk kembali ke halaman sebelumnya, kita menggunakan `Navigator.pop()`.

### Menggunakan `Navigator.pushReplacement` untuk Pindah ke Halaman Baru:
```dart
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ));
  },
```

### Menggunakan `Navigator.pop` untuk Kembali ke Halaman Sebelumnya:
```dart
   actions: [
      TextButton(
        child: const Text('OK'),
        onPressed: () {
          Navigator.pop(context);
          _formKey.currentState!.reset();
        },
      ),
    ],
```

Dengan `Navigator`, kita dapat dengan mudah mengelola navigasi antar halaman di aplikasi, baik untuk aplikasi dengan dua halaman atau aplikasi besar dengan banyak layar.

---
