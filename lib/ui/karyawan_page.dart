import 'package:flutter/material.dart';
import 'package:plantapp/ui/karyawan_form.dart';
import 'package:plantapp/widget/sidebar.dart';
import '../model/karyawan.dart';
import 'karyawan_detail.dart';

class PageKaryawan extends StatefulWidget {
  const PageKaryawan({super.key});

  @override
  _PageKaryawanState createState() => _PageKaryawanState();
}

class _PageKaryawanState extends State<PageKaryawan> {
  final List<Karyawan> _karyawan = [
    Karyawan(
      id: "1",
      nama: 'Bayu Saputra',
      tanggal_lahir: '2000-03-21',
      nomor_telepon: '088898760987',
      email: 'bayus@gmail.com',
      password: '1234',
    ),
    Karyawan(
      id: "2",
      nama: 'Airin Putri Baskara',
      tanggal_lahir: '1990-03-12',
      nomor_telepon: '088654368765',
      email: 'airin20@gmail.com',
      password: '567a',
    ),
    Karyawan(
      id: "3",
      nama: 'Rina Kartika Sari',
      tanggal_lahir: '2001-05-09',
      nomor_telepon: '088898345687',
      email: 'rinaks@gmail.com',
      password: '1267',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text(
          "Data Karyawan",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AdminForm())));
            },
          )
        ],
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: _karyawan.length,
        itemBuilder: (context, Index) {
          return Card(
              child: ListTile(
            title: Text(_karyawan[Index].nama),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      KaryawanDetail(karyawan: _karyawan[Index]),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
