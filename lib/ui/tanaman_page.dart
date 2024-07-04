import 'package:flutter/material.dart';
import '../model/tanaman.dart';
import '../model/cart_item.dart';
import '../ui/tanaman_detail.dart';
import '../ui/tanaman_form.dart';
import '../ui/tanaman_update_form.dart';
import '../ui/cart_page.dart';

class TanamanPage extends StatefulWidget {
  @override
  _TanamanPageState createState() => _TanamanPageState();
}

class _TanamanPageState extends State<TanamanPage> {
  List<Tanaman> _tanamanList = [];
  List<CartItem> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _tanamanList = [
      Tanaman(
        id: '1',
        nama: 'Anthurium Andraeanum',
        harga: 25000,
        stok: 10,
        gambar: 'assets/images/tanaman_a.jpeg',
      ),
      Tanaman(
        id: '2',
        nama: 'Tanaman Lily',
        harga: 18000,
        stok: 8,
        gambar: 'assets/images/tanaman_b.jpeg',
      ),
      Tanaman(
        id: '3',
        nama: 'Watermelon Peperomia',
        harga: 30000,
        stok: 12,
        gambar: 'assets/images/tanaman_c.jpeg',
      ),
    ];
  }

  void _addTanaman(Tanaman tanaman) {
    setState(() {
      _tanamanList.add(tanaman);
    });
  }

  void _updateTanaman(Tanaman updatedTanaman) {
    setState(() {
      final index =
          _tanamanList.indexWhere((tanaman) => tanaman.id == updatedTanaman.id);
      if (index != -1) {
        _tanamanList[index] = updatedTanaman;
      }
    });
  }

  void _deleteTanaman(String id) {
    setState(() {
      _tanamanList.removeWhere((tanaman) => tanaman.id == id);
    });
  }

  void _addToCart(Tanaman tanaman) {
    setState(() {
      final index =
          _cartItems.indexWhere((item) => item.tanaman.id == tanaman.id);
      if (index != -1) {
        _cartItems[index].quantity += 1;
      } else {
        _cartItems.add(CartItem(tanaman: tanaman));
      }
    });
  }

  void _removeFromCart(String id) {
    setState(() {
      _cartItems.removeWhere((item) => item.tanaman.id == id);
    });
  }

  void _navigateToAddTanamanForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TanamanForm(onAddTanaman: _addTanaman),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tanaman', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: _navigateToAddTanamanForm,
          ),
        ],
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
        ),
        itemCount: _tanamanList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    _tanamanList[index].gambar,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _tanamanList[index].nama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('Rp ${_tanamanList[index].harga}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _addToCart(_tanamanList[index]);
                      },
                      icon: Icon(Icons.shopping_cart, color: Colors.white),
                      label: Text('Keranjang',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                TanamanDetail(tanaman: _tanamanList[index]),
                          ),
                        );
                      },
                      icon: Icon(Icons.list, color: Colors.white),
                      label:
                          Text('Detail', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
