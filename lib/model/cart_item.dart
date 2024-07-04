import 'package:plantapp/model/tanaman.dart';

class CartItem {
  final Tanaman tanaman;
  int quantity;

  CartItem({required this.tanaman, this.quantity = 1});
}
