import 'package:flutter/material.dart';
import '../model/customer.dart';
import 'customer_detail.dart';

class CustomerItem extends StatelessWidget {
  final Customer customer;

  const CustomerItem({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(customer.nama),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tanggal Lahir: ${customer.tanggal_lahir}"),
              Text("Nomor Telpon: ${customer.nomor_telepon}"),
              Text("Alamat: ${customer.alamat}"),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CustomerDetail(customer: customer)),
        );
      },
    );
  }
}
