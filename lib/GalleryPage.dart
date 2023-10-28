import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<dynamic> galleryData = [];

  @override
  void initState() {
    super.initState();
    fetchGalleryData();
  }

  Future<void> fetchGalleryData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      galleryData = json.decode(response.body);

     // print(galleryData[0]["url"]);
      setState(() {
      });
    } else {
      throw Exception('Failed to load gallery data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Align(
            alignment: Alignment.center,
            child: Text(
              "Gallery",
              style: TextStyle(color: Colors.black87, fontSize: 30),
            )),
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: galleryData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(galleryData,index);
              },));
            },
            child: GridTile(
              child: Image.network(galleryData[index]["thumbnailUrl"],
                scale: 1,
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Center(
                    child: Text('Error loading image'),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  List<dynamic> galleryData;
  int index;
  DetailPage(this.galleryData,this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Image.network(galleryData[index]['url']),
      ),
    );
  }
}
