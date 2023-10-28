import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'TodoPage.dart';
import 'GalleryPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    List<Widget>pagelist=<Widget>[
      HomePage(),
      GalleryPage(),
      TodoPage(),

    ];

    return Scaffold(
      body: pagelist[index],
      bottomNavigationBar: SizedBox(height: 65,
        child: BottomNavigationBar(backgroundColor:Colors.white,
          unselectedItemColor:  Colors.black45,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          type:  BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedIconTheme: const IconThemeData(color: Colors.black45),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: "HOME"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_chart_outlined),
                label: "Gallery"),

            BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: "Todo"),
          ],
        ),
      ),

    );

  }
}
