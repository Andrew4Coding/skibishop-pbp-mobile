import 'package:flutter/material.dart';
import 'package:skibishop_mobile/ds/left_drawer.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _nama = "";
  int _price = 0;
  String _description = "";
  String _shop = "";
  String _imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Tambah Mood Kamu Hari ini'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  label: "Name",
                  hint: "Name",
                  onChanged: (value) => _nama = value,
                  validator: (value) =>
                      value!.isEmpty ? "Nama tidak boleh kosong!" : null,
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: "Harga",
                  hint: "Harga",
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _price = int.tryParse(value) ?? 0,
                  validator: (value) {
                    if (value!.isEmpty) return "Harga tidak boleh kosong!";
                    if (int.tryParse(value) == null)
                      return "Harga harus berupa angka!";
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: "Deskripsi",
                  hint: "Deskripsi",
                  onChanged: (value) => _description = value,
                  validator: (value) =>
                      value!.isEmpty ? "Deskripsi tidak boleh kosong!" : null,
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: "Shop",
                  hint: "Shop",
                  onChanged: (value) => _shop = value,
                  validator: (value) =>
                      value!.isEmpty ? "Toko tidak boleh kosong!" : null,
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: "Image URL",
                  hint: "Image URL",
                  onChanged: (value) => _imageUrl = value,
                  validator: (value) =>
                      value!.isEmpty ? "Link Gambar tidak boleh kosong!" : null,
                ),
                const SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Mood berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_nama'),
                                    Text('Price: $_price'),
                                    Text('Description: $_description'),
                                    Text('Shop: $_shop'),
                                    Text('ImageURL: $_imageUrl'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onChanged,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
