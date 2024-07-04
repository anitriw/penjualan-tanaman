import 'package:flutter/material.dart';
import '../model/tanaman.dart';
import '../model/cart_item.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;
  final Function(String) onRemoveItem;

  CartPage({required this.cartItems, required this.onRemoveItem});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = widget.cartItems[index];
          return ListTile(
            leading: Image.asset(cartItem.tanaman.gambar),
            title: Text(cartItem.tanaman.nama),
            subtitle:
                Text('Rp ${cartItem.tanaman.harga} x ${cartItem.quantity}'),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                widget.onRemoveItem(cartItem.tanaman.id);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Total: Rp ${widget.cartItems.fold<double>(0, (total, item) => total + (item.tanaman.harga * item.quantity)).toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
