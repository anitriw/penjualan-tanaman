import 'package:flutter/material.dart';
import '../model/karyawan.dart';
import 'karyawan_detail.dart';

class KaryawanItem extends StatelessWidget {
  final Karyawan karyawan;

  const KaryawanItem({super.key, required this.karyawan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(karyawan.nama),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tanggal Lahir: ${karyawan.tanggal_lahir}"),
              Text("Nomor Telpon: ${karyawan.nomor_telepon}"),
              Text("Alamat: ${karyawan.email}"),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => KaryawanDetail(karyawan: karyawan)),
        );
      },
    );
  }
}
