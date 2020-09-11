import 'package:carrito_inherited_widget/cartstate.dart';
import 'package:flutter/material.dart';

class ItemsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterState = CartState.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Items in cart: ${counterState.count}',
        style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}