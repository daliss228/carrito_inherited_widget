import 'package:carrito_inherited_widget/cartstate.dart';
import 'package:carrito_inherited_widget/itemsection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
      accentColor: const Color(0xFF167F67),
    ),
    home: RootWidget(),
  ));
}

class RootWidget extends StatefulWidget {
  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int count = 0;
  void addCart() {
    setState(() {
      count++;
    });
  }

  void removeCart() {
    setState(() {
      if(count>0){
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CartState(
      count: count,
      addCart: addCart,
      removeCart: removeCart,
      child: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterState = CartState.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF167F67),
        title: Text(
          'InheritedWidget',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: const Color(0xFFFFFFFF),
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 5),
                child: CircleAvatar(
                  radius: 10.0,
                  child: Text(''
                    '${CartState.of(context).count}',
                    style: TextStyle(fontSize: 15, color: const Color(0xFFFFFFFF),),
                  ),
                  backgroundColor: const Color(0xFFA11B00),
                ),
              ),
            ],
          )
        ],
      ),

      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ItemsSection(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: new FloatingActionButton(
                heroTag: 'asd',
                onPressed: counterState.addCart,
                child: new Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: new FloatingActionButton(
                heroTag: 'qwe',
                onPressed: counterState.removeCart,
                child: new Icon(
                  Icons.remove_shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

