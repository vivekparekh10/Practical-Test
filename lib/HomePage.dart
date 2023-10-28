import 'package:flutter/material.dart';
import 'ProductDetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      // print(responseData["products"][1]['id']);
      products = responseData['products'];
      // print(products[1]["price"]);
      setState(() {
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Align(
            alignment: Alignment.center,
            child: Text(
              "Product List",
              style: TextStyle(color: Colors.black87, fontSize: 30),
            )),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              products[index]["images"][0],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text("Product Name :" + products[index]['title']),
            subtitle: Text("Product Price :" + products[index]['price'].toString()),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetail(products,index);
              },));
            },
          );
        },
      ),
    );
  }
}
