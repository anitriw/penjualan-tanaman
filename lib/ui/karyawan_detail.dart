import 'package:flutter/material.dart';
import 'package:plantapp/ui/karyawan_page.dart';
import 'package:plantapp/ui/karyawan_update_form.dart';
import '../model/karyawan.dart';

class KaryawanDetail extends StatelessWidget {
  final Karyawan karyawan;

  const KaryawanDetail({super.key, required this.karyawan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Karyawan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama          : ${karyawan.nama}'),
            SizedBox(height: 8.0),
            Text(
                'Tanggal Lahir : ${(karyawan.tanggal_lahir)}'), // Format the date
            SizedBox(height: 8.0),
            Text('Nomor Telepon : ${karyawan.nomor_telepon}'),
            SizedBox(height: 8.0),
            Text('Email         : ${karyawan.email}'),
            SizedBox(height: 8.0),
            Text('Password      : ${karyawan.password}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tombolUbah(context),
                _tombolHapus(context),
              ],
            )
          ],
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
            builder: (context) => KaryawanUpdateForm(karyawan: karyawan),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
              title: Text("Hapus Karyawan"),
              content: Text("Apakah Anda yakin ingin menghapus pegawai ini?"),
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
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus", style: TextStyle(color: Colors.white)),
    );
  }
}
