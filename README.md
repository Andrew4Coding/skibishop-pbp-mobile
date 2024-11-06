E-Commerce Mobile Application for True Sigma

### 🧑‍🦰 Author
- Name: Andrew Devito Aryo
- NPM: 2306152494
- Kelas: PBP F

### ⚙️ Tech Stack
- **Backend**: Django
- **Styling**: Material App & Cupertino
- **Font**: DM Sans, Catemaran

## Tugas 7 - PBP 2024/2025
### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

**Stateless Widget** adalah widget yang bersifat statis dan tidak memiliki state atau keadaan yang berubah. `StatelessWidget` hanya dibangun sekali ketika di-render dan tidak akan berubah selama aplikasi berjalan. Contohnya, widget seperti `Text`, `Icon`, atau `Container`, yang tidak memerlukan interaksi atau perubahan data.

**Stateful Widget** adalah widget yang memiliki state atau keadaan yang dapat berubah. `StatefulWidget` dibangun ulang setiap kali terjadi perubahan pada state-nya menggunakan fungsi `setState()`. Widget ini cocok untuk komponen yang membutuhkan perubahan tampilan karena interaksi pengguna atau perubahan data, seperti `TextField`, `Checkbox`, atau `Slider`.

**Perbedaan utama**:
- **StatelessWidget** tidak memiliki state dan bersifat statis, sedangkan **StatefulWidget** memiliki state yang dapat berubah selama runtime.
- **StatelessWidget** cocok untuk tampilan yang tidak memerlukan pembaruan dinamis, sementara **StatefulWidget** cocok untuk tampilan yang perlu menyesuaikan diri dengan perubahan data atau input pengguna.

---

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

Pada proyek ini, beberapa widget yang digunakan beserta fungsinya adalah:

- **Scaffold**: Memberikan struktur dasar untuk halaman aplikasi, termasuk bagian `appBar`, `body`, dan `bottomNavigationBar`.
- **AppBar**: Menyediakan bar di bagian atas halaman yang biasanya digunakan untuk judul halaman dan aksi penting.
- **Column**: Menyusun widget-widget anak secara vertikal.
- **Row**: Menyusun widget-widget anak secara horizontal. Digunakan untuk menampilkan informasi seperti NPM, Nama, dan Kelas dalam satu baris.
- **Expanded**: Memperluas widget agar mengisi ruang yang tersedia di dalam `Row` atau `Column`, memastikan elemen-elemen memiliki ukuran yang proporsional.
- **Text**: Menampilkan teks statis dalam aplikasi, seperti judul, informasi pengguna, dan deskripsi.
- **ElevatedButton**: Tombol yang menampilkan aksi atau interaksi pengguna, seperti navigasi antar halaman atau menampilkan pesan.
- **GridView**: Menampilkan item dalam format grid atau tabel. Digunakan untuk menampilkan menu item produk dalam tata letak yang rapi.
- **Card**: Menampilkan konten dalam bentuk kartu dengan efek bayangan dan sudut melingkar, membuat konten tampak lebih terstruktur.
- **InkWell**: Memberikan efek klik dengan animasi ripple. Ini menambah interaksi pada setiap item di dalam `GridView`.

---

### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

`setState()` adalah fungsi yang digunakan dalam `StatefulWidget` untuk memperbarui state dari widget tersebut. Ketika `setState()` dipanggil, Flutter akan membangun ulang widget yang dipengaruhi oleh perubahan state, memastikan UI menampilkan data terbaru atau perubahan yang terjadi.

**Contoh variabel yang dapat terdampak dengan `setState()`**:
- **items**: Jika daftar `ItemHomepage` diubah (misalnya menambah atau menghapus item), kita perlu memanggil `setState()` agar tampilan `GridView` diperbarui dengan daftar terbaru.
- **npm, name, className**: Jika ada perubahan pada data pengguna (NPM, nama, kelas), `setState()` memungkinkan pembaruan data ini ditampilkan langsung di UI.

Dengan menggunakan `setState()`, aplikasi akan menyesuaikan tampilan sesuai dengan data terbaru yang ada pada variabel-variabel tersebut.

## Langkah-Langkah Implementasi Checklist
### Membuat Program Flutter Baru Bertema E-Commerce
1. **Inisiasi Flutter Project melalui VS Code:**
   ![image](https://github.com/user-attachments/assets/737a2748-70a3-4444-b440-636550c068dd)
2. **Membuat Flutter Project dengan nama `skibishop-mobile`.**
3. **Masuk ke codebase.**
4. **Membuat `main.dart` sebagai layout utama** dan `menu.dart` untuk menyimpan menu-menu yang akan ditampilkan di halaman utama.
5. **Menjalankan aplikasi** dengan perintah berikut:
   ```bash
   flutter run
   ```

### Membuat Tiga Tombol Sederhana dengan Ikon dan Teks
1. **Membuat widget `ItemHomepage` dan `ItemCard`** yang akan digunakan secara modular untuk menampilkan tombol.
   ```dart
   class ItemHomepage {
     final String name;
     final IconData icon;
     final Color color;

     ItemHomepage(this.name, this.icon, this.color);
   }

   class ItemCard extends StatelessWidget {
     final ItemHomepage item;

     const ItemCard(this.item, {super.key});

     @override
     Widget build(BuildContext context) {
       return Material(
         color: Theme.of(context).colorScheme.secondary,
         ...
       );
     }
   }
   ```

2. **Membuat array `items`:**
   ```dart
   final items = [
     ItemHomepage('Products', Icons.shopping_bag, Colors.blue),
     ItemHomepage('Add Product', Icons.add, Colors.green),
     ItemHomepage('Logout', Icons.logout, Colors.red),
   ];
   ```

3. **Memanggil komponen `ItemHomePage` di widget utama `HomePage`:**
   ```dart
   ...
   Expanded(
     flex: 3,
     child: GridView.count(
       primary: false,
       crossAxisSpacing: 10,
       mainAxisSpacing: 10,
       crossAxisCount: 2,
       children: items.map((ItemHomepage item) {
         return ItemCard(item);
       }).toList(),
     ),
   ),
   ...
   ```

### Mengimplementasikan Warna-Warna Berbeda untuk Setiap Tombol (Lihat Daftar Produk, Tambah Produk, dan Logout)
1. **Inisiasi warna berbeda untuk setiap tombol:**
   ```dart
   final items = [
     ItemHomepage('Products', Icons.shopping_bag, Colors.blue),
     ItemHomepage('Add Product', Icons.add, Colors.green),
     ItemHomepage('Logout', Icons.logout, Colors.red),
   ];
   ```
   
2. **Menggunakan warna pada `ItemCard`:**
   ```dart
   ...
   @override
   Widget build(BuildContext context) {
     return Material(
       color: item.color,
       ...
     );
   }
   ```

### Menampilkan Snackbar dengan Pesan
Menambahkan logika `onTap` pada masing-masing `ItemCard` untuk menampilkan pesan snackbar.

```dart
onTap: () {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: Text("Kamu telah menekan tombol ${item.name}!")));
},
```

Pesan snackbar yang muncul akan otomatis mengikuti nama item yang diberikan.
