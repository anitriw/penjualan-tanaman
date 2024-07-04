import 'package:flutter/material.dart';
import 'package:plantapp/widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text(
          "Beranda",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Pastikan jalur ke gambar Anda benar
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
