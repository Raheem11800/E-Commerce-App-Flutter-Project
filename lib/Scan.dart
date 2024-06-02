import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Scan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScanState();
  }
}

class ScanState extends State {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.5),
              color: Colors.grey.shade200,
              border: Border.all(color: Colors.black),
            ),
            child: Icon(Icons.qr_code_scanner_outlined,size: 70,),
          ),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 2),
                  child: Text("BARCODE SCAN",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Divider(
            height: 100,
            color: Colors.grey,
            thickness: 1,
            indent : 10,
            endIndent : 10,
          ),
          ListTile(
            onTap: ()=> show("products"),
            title: Text("Scan History"),
            leading: Icon(Icons.access_time_outlined),
            trailing: Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }

  void show(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
