import 'package:flutter/material.dart';

class page2 extends StatelessWidget {
  final Widget child;
  int index;

  // Widget child;s

  page2({Key key, this.child , this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("test"),),

    );
  }
}