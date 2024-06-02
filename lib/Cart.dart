import 'package:flutter/material.dart';
import 'Products%20Class.dart';

class CartScreen extends StatefulWidget {
  final List<Products> cart;

  CartScreen({required this.cart});

  @override
  State<StatefulWidget> createState() {
    return CartScreenState();
  }
}

class CartScreenState extends State<CartScreen> {
  Map<Products, int> cartMap = {};

  @override
  void initState() {
    super.initState();
    widget.cart.forEach((product) {
      cartMap[product] = (cartMap[product] ?? 0) + 1;
    });
  }

  void updateQuantity(Products product, int change) {
    setState(() {
      int currentQuantity = cartMap[product] ?? 0;
      int newQuantity = currentQuantity + change;
      if (newQuantity <= 0) {
        cartMap.remove(product);
      } else {
        cartMap[product] = newQuantity;
      }
    });
  }

  double calculateTotalPrice() {
    double total = 0;
    cartMap.forEach((product, quantity) {
      total += double.parse(product.price.replaceAll(",", "")) * quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SHOPPING CART",
          style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "PRODUCT",
                      style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "QUANTITY",
                      style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "TOTAL",
                      style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "DELETE",
                      style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey),
          Expanded(
            child: ListView.builder(
              itemCount: cartMap.keys.length,
              itemBuilder: (BuildContext context, int index) {
                Products product = cartMap.keys.elementAt(index);
                int quantity = cartMap[product]!;
                double totalPrice = double.parse(product.price.replaceAll(",", "")) * quantity;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Image.asset(
                                product.image,
                                height: 80,
                                width: 80,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.productTtile,
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    Text(
                                      product.price,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      product.color,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      product.size,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () => updateQuantity(product, -1),
                                  icon: Icon(Icons.remove_circle, color: Colors.red),
                                ),
                                Text(
                                  quantity.toString(),
                                  style: TextStyle(color: Colors.black, fontSize: 12),
                                ),
                                IconButton(
                                  onPressed: () => updateQuantity(product, 1),
                                  icon: Icon(Icons.add_circle, color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              totalPrice.toStringAsFixed(2),
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: IconButton(
                              onPressed: () => updateQuantity(product, -quantity),
                              icon: Icon(Icons.delete_forever, size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(color: Colors.grey),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${calculateTotalPrice().toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
