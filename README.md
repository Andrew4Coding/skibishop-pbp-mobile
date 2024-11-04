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
