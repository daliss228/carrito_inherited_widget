import 'package:flutter/material.dart';

class CartState extends InheritedWidget {
  CartState({Key key, this.count, this.addCart, this.removeCart, Widget child})
      : super(key: key, child: child);

  final int count;
  final Function addCart;
  final Function removeCart;

  @override
  bool updateShouldNotify(CartState oldWidget) {
    return count != oldWidget.count;
  }

  static CartState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartState>();
  }
}