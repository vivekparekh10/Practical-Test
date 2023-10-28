import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  List<dynamic> products;
  int index;
  ProductDetail(this.products,this.index);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    appBar: AppBar(

      title: Align(
          alignment: Alignment.center,
          child: Text(
            "Product Details",
            style: TextStyle(color: Colors.black87, fontSize: 30),
          )),
      backgroundColor: Colors.white,
    );
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            Image.network(widget.products[widget.index]["images"][0],width: 400,height: 400,),
            ListTile(
              title: Center(child: Text("Product Name :" + widget.products[widget.index]['title'])),
              subtitle: Column(
                children: [
                  Text("Product Price :" + widget.products[widget.index]['price'].toString()),
                 // Text("description :" + widget.products[widget.index]['description']),
                 Text("rating :" + widget.products[widget.index]['rating'].toString()),
                 Text("stock :" + widget.products[widget.index]['stock'].toString()),
                ],
              ),

              //trailing: Icon(Icons.favorite_outline),
            ),
          ],
        ));

  }
}
