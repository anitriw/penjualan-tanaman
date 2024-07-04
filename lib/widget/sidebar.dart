import 'package:flutter/material.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/tanaman_page.dart';
import '../ui/customer_page.dart';
import '../ui/karyawan_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Admin"),
            accountEmail: Text("admin@admin.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
            // Set background color for the header
            decoration: BoxDecoration(
              color:
                  Color.fromARGB(255, 82, 162, 25), // Change to desired color
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/beranda');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.local_florist),
            title: Text("Tanaman"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TanamanPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Karyawan"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PageKaryawan())); // Implement navigation logic for Pegawai page
            },
          ),
          ListTile(
            leading: Icon(Icons.person_2_outlined),
            title: Text("Customer"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PageCustomer())); // Implement navigation logic for Pasien page
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
