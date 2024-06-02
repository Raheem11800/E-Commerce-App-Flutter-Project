import 'package:flutter/material.dart';
import 'package:project_03/mens%20Database.dart';
import 'package:project_03/constants.dart';
import 'Cart.dart';
import 'Products%20Class.dart';

class Menscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenscreenState();
  }
}

class MenscreenState extends State<Menscreen> {
  List<Products> productlist = [];
  List<Products> cart = [];

  @override
  void initState() {
    super.initState();
    productlist = Database.generatedata();
  }

  void addToCart(Products product) {
    setState(() {
      cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Men\'s Products'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart,color: Colors.black,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
              );
            },
          ),
          SizedBox(width: 30,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(constants.M15),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: List.generate((productlist.length / 3).ceil(), (index) {
                int startIndex = index * 3;
                int endIndex = startIndex + 3;
                if (endIndex > productlist.length) {
                  endIndex = productlist.length;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: productlist.sublist(startIndex, endIndex).map((curr) {
                      return Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                curr.image,
                                height: 200,
                                width: 200,
                              ),
                              SizedBox(height: 10),
                              Text(
                                curr.productTtile,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Color: ${curr.color}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'Size: ${curr.size}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'Price: ${curr.price}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.add_circle, color: Colors.red),
                              onPressed: () {
                                addToCart(curr);
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}