import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_03/Cart%20Provider.dart';
import 'package:project_03/Home.dart';
import 'package:project_03/Like.dart';
import 'package:project_03/Mens%20Screen.dart';
import 'package:project_03/Nearest_Stores.dart';
import 'package:project_03/Scan.dart';
import 'package:project_03/SignIn.dart';
import 'Cart.dart';
import 'Kids Screen.dart';
import 'Womens Screen.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }

}

class MainScreenState extends State
{
  int item = 0;
  int index=0;
  List<String> msgs = ["Home","Like","Scan","Nearest Branch"];
  List<Widget> BottomMsg = [Home(),Like(),Scan(),NearestStores()];

  String msg = " ";



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       toolbarHeight: 85,
       title: Text("Blend & Bloom",style: TextStyle(color: Colors.grey.shade700,fontSize: 35,fontStyle:FontStyle.normal,fontWeight: FontWeight.bold ),),
       centerTitle: true,
       actions: [
         IconButton(onPressed: ()
             {
               Navigator.push(context,
                 MaterialPageRoute(builder: (context)=> MainScreen()),
               );
             }
             , icon: Icon(Icons.shopping_cart,color: Colors.black,)),
         SizedBox(width: 30,),
         ],
     ),
     drawer: Container(
       color: Colors.white,
       width: MediaQuery.of(context).size.width * 0.4,
       height: MediaQuery.of(context).size.height,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          IconButton(onPressed: ()=>close(context), icon: Icon(Icons.close)),
           Padding(
             padding: EdgeInsets.only(left: 95),
             child: Text(
               "Blend & Bloom",
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 35,
                 fontStyle: FontStyle.italic,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
           ListTile(
             title: Text(
               "NEW ARRIVALS",
               style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
             ),
           ),
           ListTile(
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => Menscreen()),
               );
               },
             title: Text(
               "T-SHRTS",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => Menscreen()),
               );
             },
             title: Text(
               "POLOS",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => Menscreen()),
               );
             },
             title: Text(
               "TROUSERS",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => Womenscreen()),
               );
             },
             title: Text(
               "JEANS",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => Womenscreen()),
               );
             },
             title: Text(
               "SHORTS",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: ()=>show("FRAGNENCES"),
             title: Text(
               "FRAGNENCES",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: ()=>show("SHOES"),
             title: Text(
               "SHOES",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: ()=>show("ACCESSORIES"),
             title: Text(
               "ACCESSORIES",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: ()=>show("UNDERWEARS"),
             title: Text(
               "UNDERWEARS",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: ()=>show("ACTIVE WEARS"),
             title: Text(
               "ACTIVE WEARS",
               style: TextStyle(fontSize: 10, color: Colors.black),
             ),
             trailing: Icon(Icons.arrow_right),
           ),
           ListTile(
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => Kidsscreen()),
               );
             },
             title: Text( "SPECIAL PRICES",
               style: TextStyle(
                 fontSize: 15,
                 fontWeight: FontWeight.bold,
                 color: Colors.red,
               ),
             ),
           ),
           ListTile(
             onTap: ()=>show("TRACK YOUR ORDER"),
             title: Text( "TRACK YOUR ORDER",
                 style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                 ),
               ),
           ),
         ],
       ),
     ),
     // floatingActionButton: FloatingActionButton(
     //   onPressed: ()=>show("Whats App"),
     //   child: Icon(
     //     Icons.call,
     //     //color: Colors.black,
     //   ),
     // ),

     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.white,
       selectedItemColor: Colors.black,
       type: BottomNavigationBarType.fixed,
       currentIndex: item,
       onTap: (int i) => update(i),
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: ""),
         BottomNavigationBarItem(icon: Icon(Icons.heart_broken_sharp),label: ""),
         BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_outlined),label: ""),
         BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined),label: ""),
       ],
     ),
     body: BottomMsg[item],
   );
  }

  void show(String msg)
  {
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

  void close(BuildContext context)
  {
    Navigator.pop(context);
  }

  void update(int i)
  {
    setState(() {
      item = i;
      msg = msgs[i];
    });
  }


}