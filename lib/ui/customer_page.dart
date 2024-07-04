import 'package:flutter/material.dart';
import 'package:plantapp/model/customer.dart';
import 'package:plantapp/ui/customer_form.dart';
import 'package:plantapp/widget/sidebar.dart';
import 'customer_detail.dart';

class PageCustomer extends StatefulWidget {
  const PageCustomer({super.key});

  @override
  _PageCustomerState createState() => _PageCustomerState();
}

class _PageCustomerState extends State<PageCustomer> {
  final List<Customer> _customer = [
    Customer(
      id: "1",
      nama: 'Prima Jaya Saputra',
      tanggal_lahir: '2000-05-29',
      nomor_telepon: "088898769876",
      alamat: 'Sleman',
    ),
    Customer(
      id: "2",
      nama: 'Amalia Cahyaningrum',
      tanggal_lahir: '2003-05-23',
      nomor_telepon: "088898765432",
      alamat: 'Gunung Kidul',
    ),
    Customer(
      id: "3",
      nama: 'Wahyu Kencono Wungu',
      tanggal_lahir: '2001-06-29',
      nomor_telepon: "088854670987",
      alamat: 'Sleman',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text(
          "Data Customer",
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
                  MaterialPageRoute(builder: ((context) => CustomerForm())));
            },
          )
        ],
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: _customer.length,
        itemBuilder: (context, Index) {
          return Card(
              child: ListTile(
            title: Text(_customer[Index].nama),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CustomerDetail(customer: _customer[Index]),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
