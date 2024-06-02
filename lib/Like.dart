import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Like extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LikeState();
  }

}
class LikeState extends State {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.heart_broken_sharp),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text("WishList is empty"),
            ),
          ],
        ),
      ),
    );
  }
}
