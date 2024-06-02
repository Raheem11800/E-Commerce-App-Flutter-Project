import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NearestStores extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NearestStoresState();
  }

}

class NearestStoresState extends State{
  @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Container(
        margin: EdgeInsets.only(left: 20),
         child: Text("Store Locations",style: TextStyle(fontSize: 25,color: Colors.black.withOpacity(0.5),),),
       ),
      SizedBox(height: 15,),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black),
         title: Text("Lahore",),
       ),
    Container(
    height: 1,
    width: double.infinity,
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 10),
     ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Hyderabad",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Multan",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Islamabad",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Karachi",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Quetta",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Gujrat",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Gujranwala",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Sialkot",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Sargodha",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
       ListTile(
         leading: Icon(Icons.location_on_outlined,color: Colors.black,),
         title: Text("Sahiwal",),
       ),
       Container(
         height: 1,
         width: double.infinity, // Expand to fill the available width
         color: Colors.grey,
         margin: EdgeInsets.symmetric(horizontal: 10), // Same as indent and endIndent
       ),
     ],
   );
  }

}