import 'package:flutter/material.dart';
import 'package:plantapp/ui/tanaman_detail.dart';
import '../model/tanaman.dart';

class TanamanItem extends StatelessWidget {
  final Tanaman tanaman;
  final Function onDelete;

  TanamanItem({required this.tanaman, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(tanaman.gambar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(tanaman.nama),
          subtitle: Text(
              'Harga: ${tanaman.harga.toString()} | Stok: ${tanaman.stok.toString()}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => onDelete(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TanamanDetail(tanaman: tanaman),
              ),
            );
          },
        ),
      ),
    );
  }
}
