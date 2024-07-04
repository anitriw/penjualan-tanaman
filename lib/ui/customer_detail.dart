import 'package:flutter/material.dart';
import 'package:plantapp/ui/customer_page.dart';
import 'package:plantapp/ui/customer_update_form.dart';
import '../model/customer.dart';

class CustomerDetail extends StatelessWidget {
  final Customer customer;

  const CustomerDetail({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Customer",
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
            Text('Id             : ${customer.id}'),
            SizedBox(height: 8.0),
            Text('Nama           : ${customer.nama}'),
            SizedBox(height: 8.0),
            Text('Tanggal Lahir  : ${customer.tanggal_lahir.toString()}'),
            SizedBox(height: 8.0),
            Text('Nomor Telepon  : ${customer.nomor_telepon}'),
            SizedBox(height: 8.0),
            Text('Alamat          : ${customer.alamat}'),
            SizedBox(height: 8.0),
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
            builder: (context) => CustomerUpdateForm(customer: customer),
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
              title: Text("Hapus Customer"),
              content: Text("Apakah Anda yakin ingin menghapus pasien ini?"),
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
