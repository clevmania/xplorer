import 'package:explorer/constant.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: buildAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(icon: Icon(Icons.menu, color: kIconColor), onPressed: () { }),
      actions: [
        IconButton(icon: ClipOval(child: Image.asset("assets/images/profile.png")) , onPressed: () {})
      ],
    );
  }
}