import 'package:flutter/material.dart';
import '../model/tanaman.dart';

class TanamanForm extends StatefulWidget {
  final Function(Tanaman) onAddTanaman;

  TanamanForm({required this.onAddTanaman});

  @override
  _TanamanFormState createState() => _TanamanFormState();
}

class _TanamanFormState extends State<TanamanForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  String _gambarPath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Tanaman',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama Tanaman'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tanaman harus diisi';
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
                    return 'Harga harus diisi';
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
                    return 'Stok harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Path Gambar'),
                onChanged: (value) {
                  setState(() {
                    _gambarPath = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Tanaman newTanaman = Tanaman(
                        id: DateTime.now().toString(),
                        nama: _namaController.text,
                        harga: double.parse(_hargaController.text),
                        stok: int.parse(_stokController.text),
                        gambar: _gambarPath, // Simpan path gambar
                      );
                      widget.onAddTanaman(newTanaman);
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 82, 162, 25)),
                  child: const Text("Simpan",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
