import 'package:flutter/material.dart';
import 'package:plantapp/ui/tanaman_update_form.dart';
import '../model/tanaman.dart';

class TanamanDetail extends StatelessWidget {
  final Tanaman tanaman;

  TanamanDetail({required this.tanaman});

  @override
  Widget build(BuildContext context) {
    // Calculate image height and width based on screen width
    double imageHeight = MediaQuery.of(context).size.width / 3;
    double imageWidth = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tanaman.nama,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: imageHeight,
                width: imageWidth,
                child: Image.asset(
                  tanaman.gambar,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text('Nama: ${tanaman.nama}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text('Harga: Rp ${tanaman.harga.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Stok: ${tanaman.stok}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _tombolUbah(context),
                  _tombolHapus(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _tombolUbah(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TanamanUpdateForm(tanaman: tanaman),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
      ),
      child: const Text("Ubah", style: TextStyle(color: Colors.white)),
    );
  }

  _tombolHapus(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implement your delete functionality here
        // For example, show a confirmation dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Hapus Tanaman"),
              content: Text("Apakah Anda yakin ingin menghapus tanaman ini?"),
              actions: [
                TextButton(
                  onPressed: () {
                    // If user confirms, perform the delete action
                    // For example, you can call a method to delete the pegawai
                    // Then navigate back to the previous screen
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pop(); // Navigate back to the previous screen
                  },
                  child:
                      const Text("Ya", style: TextStyle(color: Colors.white)),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                TextButton(
                  onPressed: () {
                    // If user cancels, just pop the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text("Tidak",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
      ),
      child: const Text("Hapus", style: TextStyle(color: Colors.white)),
    );
  }
}
