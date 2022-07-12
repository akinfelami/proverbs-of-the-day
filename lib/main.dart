import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/feed.dart';
import 'pages/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });

  }

  static const List<Widget> _pages = <Widget>[
   Home(),
   Feed(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proverbs Daily',
      theme: ThemeData(
        brightness: Brightness.light,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        fontFamily: 'Inter',
      ),
      home: Scaffold(
          backgroundColor: const Color.fromRGBO(240, 245, 245, 1),
          appBar: AppBar(
            shadowColor: Colors.orangeAccent,
            backgroundColor: Colors.deepOrange[500],
            leading: Image.asset('assets/bible.png'),
            title: const Text('Proverbs Daily'),
          ),
        body: IndexedStack(
            index: _selectedIndex,
            children: _pages
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepOrange[500],
          iconSize: 40,
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed,),
              label: 'Feed',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),

      ),

      // initialRoute: '/',
      // routes: {
      //   '/' : (context) => const Home(),
      //   '/feed': (context) => const Feed()
      // },
    );
  }
}

