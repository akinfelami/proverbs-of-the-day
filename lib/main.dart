import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/feed.dart';
import 'pages/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        backgroundColor: Colors.white30
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const Home(),
        '/feed': (context) => const Feed()
      },
    );
  }
}

