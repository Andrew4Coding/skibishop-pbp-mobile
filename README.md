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

---

## 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah bagian dari package `pbp_django_auth` yang berfungsi untuk:
- **Mengelola Autentikasi:** Menyimpan sesi login pengguna melalui cookie.
- **Menyederhanakan HTTP Request:** Mempermudah proses pengiriman data dengan autentikasi tanpa harus menambahkan header secara manual.
- **Mendukung Stateful Request:** Mengingat status login pengguna di berbagai request.

Instance CookieRequest perlu dibagikan agar data pengguna yang login akan telah tersimpan sebelumnya melalui cookie sehingga dapat diakses dari mana saja, misalkan status login, nama, email, dll.

---

## 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. **Input Data:**
   Pengguna memasukkan data produk melalui halaman `product_entry_form.dart`.

2. **Mengirim Request:**
   Setelah mengisi input, pengguna akan mengklik button subimt, dan data akan dikirim ke server django menggunakan package `http` atau `CookieRequest` dalam body yaitu dengan format json.

3. **Proses di Backend:**
   - Server Django menerima data request melalui `urls.py` lalu logic diproses di `views.py`.
   - Backend memproses data (misalnya menyimpan atau membaca dari database).
   - Django mengembalikan respons dalam bentuk JSON.

4. **Menerima Respons:**
   Aplikasi Flutter menerima respons JSON dari server.

5. **Decode Data:**
   Respons JSON dikonversi menjadi objek Dart (menggunakan model).

6. **Menampilkan Data:**
   Data yang sudah dikonversi ditampilkan dalam ke tampilan FLutter.

---

## 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

### **Proses Login**
1. **Input Data:**
   Pengguna memasukkan email dan password di halaman Login.
2. **Mengirim Request:**
   Button Login diklik dan data akan dikirim ke endpoint login Django menggunakan `CookieRequest`.
3. **Proses Backend:**
   - Django memverifikasi credential pengguna.
   - Jika berhasil, server mengembalikan cookie autentikasi.
4. **Menyimpan Status:**
   Cookie disimpan di `CookieRequest` untuk digunakan pada request berikutnya.
5. **Tampilan Menu:**
   Setelah login berhasil, menu utama aplikasi ditampilkan sesuai dengan status login.

### **Proses Register**
1. **Input Data:**
   Pengguna memasukkan informasi akun (misalnya nama, email, password).
2. **Mengirim Request:**
   Button Register diklik dan data akan dikirim ke endpoint register Django menggunakan `http` atau `CookieRequest`.
3. **Proses Backend:**
   - Django menyimpan data pengguna baru ke database.
   - Django mengembalikan respons sukses.
4. **Notifikasi:**
   Flutter menampilkan pesan sukses atau error berdasarkan respons, lalu mengarahkan pengguna ke halaman login.

### **Proses Logout**
1. **Request Logout:**
   Button Logout di klik, lalu Flutter mengirimkan request ke endpoint logout Django menggunakan `CookieRequest`.
2. **Hapus Cookie:**
   Django menghapus session pengguna.
3. **Update Status:**
   Aplikasi Flutter memperbarui status pengguna menjadi tidak login.
4. **Navigasi:**
   Pengguna diarahkan kembali ke halaman login.


## Langkah-langkah Implementasi Checklist
### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
1. Membuat sebuah view baru di project django
   ```python
      ...
      @csrf_exempt
      def register(request):
          if request.method == 'POST':
              data = json.loads(request.body)
              username = data['username']
              password1 = data['password1']
              password2 = data['password2']
      ...
   ```
2. Membuat stateful page pada umumnya
3. Membuat form yang berisi input username, password, dan konfirmasi password
4. Membuat logic button registrasi
   ```dart
    final response = await request.postJson(
     "http://localhost:8000/auth/register/",
     jsonEncode({
       "username": username,
       "password1": password1,
       "password2": password2,
     }));
   ```
5. Jika registrasi berhasil maka pengguna akan diarahkan ke login page
   ```dart
      ...
        Navigator.pushReplacement(
       context,
       MaterialPageRoute(
           builder: (context) => const LoginPage()),
     );
      ...
   ```
   
### Membuat halaman login pada proyek tugas Flutter.
1. Membuat view baru di Project Django
   ```python
      @csrf_exempt
      def login(request):
          username = request.POST['username']
          password = request.POST['password']
          user = authenticate(username=username, password=password)
   ```
2. Membuat stateful page pada umumnya
3. Membuat form yang berisi username dan password
4. Membuat logic button login
5. 
6. 
### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
### Membuat model kustom sesuai dengan proyek aplikasi Django.
1. Mengecek konten dari `localhost:8000/json`
2. Menggenerate model dart dengan bantuan website Quicktype
3. Membuat file baru bernama `product_entry.dart` untuk meletakan model yang telah digenerate sebelumnya

### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
1. Membuat page stateful pada umumnya
2. Membuat function untuk melakukan fetching json:
   ```dart
        Future<List<ProductEntry>> fetchMood(CookieRequest request) async {
       final response = await request.get('http://localhost:8000/json/');
   
       // Melakukan decode response menjadi bentuk json
       var data = response;
   
       // Melakukan konversi data json menjadi object ProductEntry
       List<ProductEntry> listMood = [];
       for (var d in data) {
         if (d != null) {
           listMood.add(ProductEntry.fromJson(d));
         }
       }
       return listMood;
     }
   ```
4. Menggunakan Future Builder pada body dari Scaffold:
   ```dart
   ...
    body: FutureBuilder(
        future: fetchMood(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
   ...
   ```
   Hal ini dilakukan untuk melakukan fetching json secara asyncronus. Ketika data belum terload, maka akan ada loder yang diperlihatkan ke pengguna. Jika data sudah berhasil terload, maka data akan langsung ditampilkan dalam bentuk list.
   
### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
1. Membuat sebuah stateful page pada umumnya
2. Menyatakan variabel-variabel yang menjadi atribut dari page detail (misalnya Uuid, price, description, dll)
   ```dart
     final String uuid;
     final int price;
     final String description;
     final String shop;
     final String imageUrl;
     final int sold;
   
     ProductDetailPage(
         {required this.uuid,
         required this.price,
         required this.description,
         required this.shop,
         required this.imageUrl,
         required this.sold});
   ```
4. Menghandle jika card product di klik di halaman list product
   ```dart
      ...
      child: InkWell(
           onTap: () {
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => ProductDetailPage(
                   uuid: snapshot.data![index].pk.toString(),
                   price: snapshot.data![index].fields.price,
                   description:
                       snapshot.data![index].fields.description,
                   shop: snapshot.data![index].fields.description,
                   imageUrl: snapshot.data![index].fields.imageUrl,
                   sold: snapshot.data![index].fields.sold,
                 ),
               ),
             );
           },
      ...
   ```
6. Menggunakan atribut untuk ditampilkan pada halaman detail
   ```dart
               Image.network("https://picsum.photos/seed/picsum/200/300"),
            SizedBox(height: 16.0),
            Text(
              'Price: \$${widget.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Description: ${widget.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Shop: ${widget.shop}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Sold: ${widget.sold}',
              style: TextStyle(fontSize: 16),
            )
   ```

### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
Filter berdasarkan pengguna telah dihandle melalui view json di projek django yaitu:
```python
   ...
    data = Product.objects.filter(user=request.user)
   ...
```
Dengan filter ini, maka dijamin bahwa produk yang ditampilkan adalah milik pengguna yang sedang login saat ini.
