import 'package:flutter/material.dart';
import '../model/tanaman.dart';

class TanamanUpdateForm extends StatefulWidget {
  final Tanaman tanaman;

  TanamanUpdateForm({required this.tanaman});

  @override
  _TanamanUpdateFormState createState() => _TanamanUpdateFormState();
}

class _TanamanUpdateFormState extends State<TanamanUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _hargaController;
  late TextEditingController _stokController;
  late TextEditingController _gambarController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.tanaman.nama);
    _hargaController =
        TextEditingController(text: widget.tanaman.harga.toString());
    _stokController =
        TextEditingController(text: widget.tanaman.stok.toString());
    _gambarController = TextEditingController(text: widget.tanaman.gambar);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    _stokController.dispose();
    _gambarController.dispose();
    super.dispose();
  }

  void _updateTanaman() {
    if (_formKey.currentState!.validate()) {
      Tanaman updatedTanaman = Tanaman(
        id: widget.tanaman.id,
        nama: _namaController.text,
        harga: double.parse(_hargaController.text),
        stok: int.parse(_stokController.text),
        gambar: _gambarController.text,
      );
      Navigator.of(context).pop(updatedTanaman);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Tanaman',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _hargaController,
                decoration: InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Harga harus berupa angka';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stokController,
                decoration: InputDecoration(labelText: 'Stok'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Stok tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Stok harus berupa angka';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _gambarController,
                decoration: InputDecoration(labelText: 'URL Gambar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'URL Gambar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _updateTanaman,
                  child: Text('Update', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
