import 'package:explorer/constant.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu, color: kIconColor), onPressed: () { }),
        actions: [
          IconButton(icon: Image.asset("assets/images/profile.png") , onPressed: () {})
        ],
      ),
    );
  }
}